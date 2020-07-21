Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6ER3T4AKGQE67TAFSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3412A2283B1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 17:25:45 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id l5sf1364505wml.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:25:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595345145; cv=pass;
        d=google.com; s=arc-20160816;
        b=vEdtKGcB2ibxb+yjsg+rY4SxvSowdPj0voBNcuXY9DwYudQKFcf4k8xd5aFPzhJYIf
         jddKZAFH2w8sGHk55xOnnyQv1UpW74HIoAzIN2ITKWXaeImt/YMvy/54NMcN4Tqnd9a0
         onmPKxNJ9CNA8aCzQ1kMD8ypc7fuasDSOR9WKTOVSA/dMqUoxtFKPTP/Eigu9pHWyCA8
         GfV5pjiJYgVq44G3twLSSRI8C5Z3orr8FqDiedUtjreaPKa4jm0oSTiEoqemFkXc/0WT
         In3dOCqvOPs7mrQQuCTLgHvSXedERKu0i5XPtm2FtSED1w7Ma7UVb6UgUh9Feo17Hcpv
         w2sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=rzIRYZPB2pcX5QcNKhoh6t7diFTnSrgJUiG5nw+1q4g=;
        b=bS+TO9T5SKn6OnfMfa2NcugEsApNTSxC9qQ/8zXWxMtm10oBZkaEn3XBE7YUIXHhK9
         ZoMvD30tozl/nUjDCtKCaGLMgavfg8JET2SnQmUX5tb9i4igHYGJZRR7JjCe+GJFvasu
         X1nqv15YeTlKJVQV0T23Aav8kUplC4hvDSKB0zBzAjuA8XOB39Q0BsFui7UEpk/wcw24
         anfF1zawYh4u55p/sT8Q+/SJXiRck38xImnriDEWp87sq6p4NyI7vxhXMUgreK/N7QKh
         iSuHLZpfoDlJwzSLPYluhLSIgzd9kSuJYTVZEvAhsWEgNCrGKrE/+CB5GDVBwFkqZMJc
         015A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rzIRYZPB2pcX5QcNKhoh6t7diFTnSrgJUiG5nw+1q4g=;
        b=HpW3aBL8BiFwoyjRtLaHgeWrH2sqlXn76hQgpbbCmVCM0ljW0x4x4K2T8qzY5uWQ3j
         AU1dRS7czhQFV9R8k1QgdizvOXDfLcg3qSRBSoWf1ZrouAzZisZP8R/WUuv3jzKBmCrO
         VeZImyzsEx2ntnOWxjQYmqxycuzpK3eKmK8haylXXkAx5bGu22UBhetF/4XBOXkxEVVG
         zvZq9ymxQBI0ChgivfkXLU923lubnYlC4JUto93hHAevqgy6X7l6qYZT0bhBMO2cGyG2
         HmUD/cDNwQb5/IJODEkRCBYRbplcC4ASnGLLTIpdk9nJn4Y5JD/uIJbTm8uMJRVa5g71
         dnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rzIRYZPB2pcX5QcNKhoh6t7diFTnSrgJUiG5nw+1q4g=;
        b=K7wrz6G/21u20CtIcvhX+zzpMkRj3d6KyMrbDfo8bhXHe5hxDSJKbUuAXZh8cQ7HTP
         N4o+6mTxV3lJ/MmBXuNHxcPWyMOglNaMrZgsVjSwveol1Pmb983i5HkoE9tY/eFtC5Hl
         tyHajygBpKVgILOT7s2Lx/0LC6xXE1dCcvQzWiVmzrAceWN0ibD3Ola/zLodrOqsDr91
         0QRZ0YX7rUiXfmjmaf6KJFBVFLihplKsuqKLhc0v31ewM9hEq0Xd//eMWJMkKLX3c2va
         GPqbuQsjl0dovLLviFf2sG/kVDeY3h0/gOmpiATx/pJRefoN6xIf8CTHEdipG6Hk24y6
         H8bA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530TqidrfOa4WFuvEvtmZfi7WEoG6e4hZuh5rY5cEGki6GDTg1eP
	xh/am7xOmaAdqNKp+/oBMf4=
X-Google-Smtp-Source: ABdhPJxHbIl8wcOtYo511g772/r99RFgim4Aj7qAKn/Up/mwCXJaBAYzlZlo02LzFZC8uA48rxk0Mg==
X-Received: by 2002:a05:600c:2317:: with SMTP id 23mr4729875wmo.72.1595345144856;
        Tue, 21 Jul 2020 08:25:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a587:: with SMTP id o129ls1488448wme.2.canary-gmail;
 Tue, 21 Jul 2020 08:25:44 -0700 (PDT)
X-Received: by 2002:a7b:ce97:: with SMTP id q23mr4587455wmj.89.1595345144077;
        Tue, 21 Jul 2020 08:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595345144; cv=none;
        d=google.com; s=arc-20160816;
        b=SD7yIDZKU6rYK654Emq98B7lhtm9ZHpW0fPnDcw+4psTQI7DPL9j3cyGmeXFLwPByI
         xA5QswnTzOhK7mk4CfFeGL5noZD10nxTcbp2/kGpTE0yVqPfbnIbj3arzAHVW5tspI/3
         rvMVuE+7S6KbpcwN5jTJSVlJ7L9EVBqO+6XJ0oJi+k+HHNkdnY8u6mKt31VJHE+YQF+t
         mZ+/9S4OdoRiY/NzdpELn7WM0Zy6VYbS1SkMoL/7FEEs/NZaqsHqYyVjMMHyB5l5rDtD
         edhhicuF/k+ddV9oDMo3jEX0nfHwnoeZd7hnCYsXSc4lUZLEsiKgg0RMRFhAv4ZCdn8X
         p3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1Pf7ZfL44r96mekXIVIu+KPxifipXKXbwN/0KQsu/08=;
        b=x7ia0BmZDP31CKpm0ZSwLLGDitwDyQnpsjw4lCakSZaCcNFY/2dYqphQCNhC9/FHEw
         XBom4K2qalpkVxQ6HpGj8la3qcUBqabSEyLLME/81C6sHuADiovAvkI8+zKvOcfScjLt
         zGD+5bR96K63tMNwp7/X53ZcUws+EmSHLuWwGrnkh9Dvv+eFTFeKTF6oo+Pd3OYunpAn
         7M+OpRoczQ2OqZ3yVhGlP3+ZWpVXRs1L0iARk2bNFcEtJIalwlak+56cn04PybY7CGPg
         vJrznZKDb/XRwTmOdyVBFsoXwUflLDu68jb27Qtr9ZxhxSgbsHeDV3+RdTLa5i9ZD6dT
         xxYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s79si133701wme.4.2020.07.21.08.25.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 08:25:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 06LFPgeG002104
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jul 2020 17:25:42 +0200
Received: from [167.87.32.116] ([167.87.32.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06LFPgIH021880;
	Tue, 21 Jul 2020 17:25:42 +0200
Subject: Re: Is Jailhouse already used on products? And if not what's the gap?
To: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
 <1e8a7abd-91e8-26b2-3446-e9734bcf8d86@siemens.com>
 <526c5075-2422-4c20-9563-08e2b166d60fn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <53766782-fbb9-d91f-592d-bc932955bafa@siemens.com>
Date: Tue, 21 Jul 2020 17:25:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <526c5075-2422-4c20-9563-08e2b166d60fn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

On 21.07.20 16:33, contact....@gmail.com wrote:
> I have been reluctant to ask this question for quite a while, especially=
=20
> from third perspective security, which actually goes hand-in-hand with=20
> the second.
>=20
> Jan schrieb am Montag, 20. Juli 2020 um 23:27:54 UTC+2:
>=20
>     On 20.07.20 09:57, Rick Xu wrote:
>      > For 3 reasons, first, it uses a LINUX as a host OS and then
>     changes it
>      > to a guest OS, so a running host OS was saved.
>      > Second, less virtualization and more real-time.
>      > Third,=C2=A0 it's easy to use.
>      > [..]
>      > And if it has not been used for products, why?
>=20
>  From my last months' view of setting up an academical use-case of a=20
> mixed criticality/mixed security-level system, from the perspective of=20
> an application-oriented engineer, I would not agree on the term 'easy'.=
=20
> I have also setup my use-case using other hypervisors, which I would=20
> consider 'easier', but I hit other barriers. Though, everything has pros=
=20
> and cons and I may be comparing apples with chocolate cheesecake, not=20
> blaming anyone.
> It is really cool to see the improved features and the HW support=20
> growing on ARM systems. At this point, I find Jailhouse being quite=20
> tightly interwoven with its underlying HW, in other words, without=20
> excellent knowledge of the HW, setting up JH is really hard.
> If I had only one wish, it would be improving the documentation for=20
> Jailhouse integrators.

I don't disagree. I think NXP and TI did some work in the context of=20
their SDKs, though even that is limited when a customer actually wants=20
to map that on a concrete product design. And general bits of=20
information are better shared in the central project. Contributions=20
welcome (TM)!

>=20
>     Jailhouse is primarily useful in two application areas. [...]
>=20
>     The second, still more research-like area is functional safety. This =
is
>     our (Siemens) primary focus with Jailhouse. And while we are still
>     waiting for and even collaborating on developing [3] a certifiable [.=
..]
>=20
> The Selene Project sounds interesting, all the best with that!
> I am/was working on a project on mixed-criticality security=20
> certification and certifiable HW really is still a blind spot. (what=20
> about, "we just _trust_ Intel processors to do the right thing"?!)
>=20

Would you enjoy riding a train where the signalling system was built=20
with blind trust? Don't worry, you won't because the authorities would=20
not allow us to release such trains onto the track.

> I believe, in the not so far future a good portion of mixed-criticality=
=20
> systems will also require security certification (to prove integrity of=
=20
> the safety function). Nothing can function in a void. Any (modern)=20
> critical functionality requires some sort of networking / data exchange=
=20
> and it is quite wise to split that off into different cells, so there=20
> are different certification levels - both in terms of safety (thorough,=
=20
> long-term) and of security (quick update/patches). Jailhouse really=20
> shows how much we trust in the underlying HW for these separation=20
> guarantees.

Exactly our concerns. So even if you make it "simpler" by not using=20
hardware virtualization (with its arch and SoC specialties), you will=20
end up trying to certify a "simple" OS that does the partitioning for=20
the different functions with "standard" OS/process isolation means.=20
And... you will still hit almost the same questions about complex=20
multicore hardware, how to ensure it does what needs to do for the OS in=20
that case. Plus you may end up with a way more complex partitioning=20
layer, way closer to Linux than to Jailhouse.

> There are evolving security standards like ISO62443, or, e.g., its=20
> derivative EN 50701 for railway. However, from my current understanding=
=20
> Jailhouse is still too "low-level" and would require more tooling and=20
> documentation to enable "easy" product certification. And this could=20
> become a professional/commercial service beyond the open-source=20
> initiative or requires additional forces in the product development.

Definitely. We went with a plan for many of those todos /wrt safety to=20
T=C3=9CV a couple of years ago, at a time where we were still hoping for a=
=20
breakthrough on the hardware front. It would be quite a bit of work, but=20
it is more or less clear that this would be feasible (was also the=20
inofficial feedback from the authorities back then), and that also=20
economically. Still, more homework would be needed to map results on a=20
concrete product.

BTW, https://cip-project.org is looking into 62443 compliance for a=20
small Linux base system. I'm not directly involved on that topic but on=20
the project in general, and I can confirm from that level that concrete=20
topics so far are different from what is bothering us /wrt safety=20
certifications.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/53766782-fbb9-d91f-592d-bc932955bafa%40siemens.com.
