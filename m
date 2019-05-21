Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBVPSSDTQKGQELN5RP6Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id B75F5256F5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 19:45:57 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id m2sf3291907ljj.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 10:45:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558460757; cv=pass;
        d=google.com; s=arc-20160816;
        b=sqWhPzyqMNZWRJs7jLLpQmt/tCRtXhz3VDZotU52QRACJIsXuPH/IDIZFLh1Hk9M/i
         sUZPiv/Uegeym2xF9gDK1zFkja+lPM6jJldmGTI/fjMAN1kmE5meAqFrVMyFJNmexq9K
         l7e1KC5nKS5O2yPauPbs9D3cJGARaO9zSJ+jmHf3shtvuhdqurdrpB3fmvX/aUsrcHYK
         gh7DB9Su/pWtucZgqwQe4EoYB3lsNsp3eEm8Q/+tcj7jhZxizFicHHfTD0QkncqorNg0
         X0Bmiu5AEaLKAFodqDQLbEtEvEIqBm72C/0xMIb2maQOGLsmOnlOkoF7r+iq+9U/lNFH
         zi5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=UFOVYYye4XHWGZqQbl5Ifrc2fsRIwf3LVUKNAvhuby4=;
        b=cHffKR4tMkR+kEbKtATDpKX6N9AN74ypzo521tISqi8XMaJjtAkm0FtzexZA17OCeI
         OFD2+xh7wS+QuIA1DF1vGCbRJgmJ47Ib3baFZfSPAYKRBhnMddeJn0xJjkU/iSFkbaZN
         Sye6QGh96aD5TWGJEJJFkfE9JW6N98sMN650h6micUxFbtTVzfOo32ZxHyqqD9wS/sxV
         RlJPOPHXMlQ/NGhlmEpRll2BJR5eiM891pEPJymn2+5WzOObwATHu6dBjaKnOuG4H0I5
         Def6NQOqghfLSmDeKSD0HdyjjpbSsybwJWec3+O9tXby4O4xFo7ExUUIKfnQSgAtvXGr
         YS0g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=h3rR0RC7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UFOVYYye4XHWGZqQbl5Ifrc2fsRIwf3LVUKNAvhuby4=;
        b=fdFQunEn7oa1I+8f+zzQdD9WF6G65wY4tsMk6hHdHdH3/bC0wYL5QZpfyjQc7kR0/p
         LJIgGsVxUbXkDjtPgYR12AFOy+/yzCPjyHqnSuQo3S7sf6JBo3IRuWzPoBxVAPQm7H0x
         6IZ1/qCBNb1A8Qr4kATDDIe6juq00NNUZoLwrvwaYKfSg2oKSeqhzMLeR4ojWFR+VKwL
         /EvJ1r/PS4Rjc9gRSfowoy9OTAFiTKcVWFgIOWqaqVy5q8IQ6PGTQNcxASpkJ9oFNUYw
         ydvjrCgEQj4h2Kc46+NJBxo3Ln+jy+7iwnMwskeBRxqkTbsHNNiyzzVQFi/5ZBX0+ONP
         aDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UFOVYYye4XHWGZqQbl5Ifrc2fsRIwf3LVUKNAvhuby4=;
        b=M/qJqrUqmAvJr+GwL3s9L0dyzarSG4lliWtjj3SvKJuCxcixvAS6BRgdAy777mMMqj
         CWEKLyGgUZH7o3zrdjjmxIlAS/R3Sdln/Y+Ou65OlwKfxIMvYr7zSPAOduGEdTsCJr4Q
         C+4yZjRhE3N9o4+V7nbWd4NBB9bcHm9USKGHqg5kYcxa1Tyih69zuXdamhLKx1InQk0v
         xlBZz5eEdEvYsy8DR+pJqUGxWDvWo5YLtzu8xg3+KQ78grBPoHNJegCfRNyirJrEP2a1
         W5hbmjIyWT8zp0NFbVqANZpWreiCHL/vBsi5+730hpFnRWtiELaHp3k/5K5bdNzfu66k
         jhCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVAZkiHgvs7LceygYflFSeUNIlFHUoohT1dW3J+EBLRssgh0lxK
	L+LBSxr8oNqpMY28/G6gZnE=
X-Google-Smtp-Source: APXvYqxVUTUb2x7oa9MPrZWH3qbGGvbJRiPNTnq3sYhBPb7F/xZQZces870wTXPfp4MQpEB+SmUtSg==
X-Received: by 2002:ac2:53ad:: with SMTP id j13mr3365820lfh.14.1558460757316;
        Tue, 21 May 2019 10:45:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9050:: with SMTP id n16ls2401599ljg.0.gmail; Tue, 21 May
 2019 10:45:56 -0700 (PDT)
X-Received: by 2002:a2e:9112:: with SMTP id m18mr27441850ljg.181.1558460756821;
        Tue, 21 May 2019 10:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558460756; cv=none;
        d=google.com; s=arc-20160816;
        b=DaXz2Cai4/htbUcxJ/c8OjY1QQrSoXO2Wz27hL4n9VW7dv3UzkEdcxJff3SELny0RG
         VmFokrhFQz7xKlrtgHYblyPUAXFlLPhlpLqyZ5ZX9xOOeSwbkXFCVJzLsQKBIpOkom0l
         QD3jt3+H19+tE+aiTM05ZUFuniACW7Yy+N37uVF7gUSrf+QTe3FSffEqETw4w4hYB9yk
         4hcTzNG2V0wES8bnRElw0w41u74+HEGLsWfSdc76bw+M4Gx2vjkb7B6/Pz0dLgDN56O3
         HHIhklskBCkVdpuJktXgp/aTG7pXL085/PI1pcYtAAFKxMivItF7R9fQWDf+Vz+rJzCK
         F3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=YXeCK6rRABEQl18U1SJkY+HquEjrPhl0dJB5A5pSBSs=;
        b=IqtTAQ/SD3WHtuj6UR3G+vAs4hMkT7U7qUOlv5HAQLqYlR/HglnRTIX/UfI9iPvV2n
         SjFcqtUhtzb4Q1vC4JG+N4M8ueV0CpaM/+25/VshwMcRy5J5HFpbu5/1z4CgvffE3q7D
         Er9aYFJF0rE8ncerSYpB/gc0mB7n2v08z8rYHDtcX1NF3Tzin76nYtsfKxBCf2siDGwc
         URX3AQlPJnJxSG8TL83/GO3xD4tTu6IP1CXg7GAE5pCVeJswplQNm+qSN7qirwGw3Q+e
         29n/x4L9k7vqKx8PEg2r8MkBysEF8Mjd9ctPkDUaYtYThoBmtFeKXDyiiDkq6i6L2XL0
         tJNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=h3rR0RC7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id o133si119829lfo.0.2019.05.21.10.45.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 10:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 457jq660sPzy6p;
	Tue, 21 May 2019 19:45:54 +0200 (CEST)
Received: from [172.23.4.153] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 May
 2019 19:45:54 +0200
Subject: Re: VT-d: IOMMU exception with unknown fault reason
To: Yasser Shalabi <yassershalabi@gmail.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
CC: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>, Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
 <fd82641f-4f35-3674-af69-68fb41624fd8@siemens.com>
 <db894a08-8c3a-cb64-2c84-ac595f02b6e0@oth-regensburg.de>
 <339bf164-d7b1-f9ef-2023-b6fbb9d5c098@siemens.com>
 <6a8fecef-27d7-b300-4a14-e874f459ea4b@oth-regensburg.de>
 <CACkfA5tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8A@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <909bd5cb-de56-4cc7-c435-303893ef22d6@oth-regensburg.de>
Date: Tue, 21 May 2019 19:45:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACkfA5tm2H-LeU0MnQWM0TZGOOoeSjuAY8FeRNRODQCceJr-8A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=h3rR0RC7;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 5/21/19 7:43 PM, Yasser Shalabi wrote:
> Yeah, sorry been caught up and lost track of doing this. Will do it ASAP.=
=C2=A0
>=20
> I=E2=80=99ll will also try to add some code to dynamically determine PKE =
support
> to avoid setting it for older platforms (Jan previously requested this).

in Jan's last mail, he wrote that your original patch is fine:

> Checking the code again and the comment I wrote around it, my
> remark in github that we would need discovery was actually overkill:
> The whole purpose of X86_CR4_RESERVED is to filter out future unknown
> bits. But CR4.PKE is no longer unknown, and it is apparently safe to
> allow it to the root cell. IOW, that commit was fine (if it had been
> submitted

  Ralf

>=20
> Thanks for the reminder.
>=20
> Yasser
>=20
> On Tue, May 21, 2019 at 12:38 PM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de
> <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>=20
>     Hi Yasser,
>=20
>     I hit the same CR4 PKE-bit case as you did a month ago.
>=20
>     May I ask you to resend the patch (with a Signed-Off line) to the
>     mailing list?
>=20
>     Thanks
>     =C2=A0 Ralf
>=20
>     On 5/21/19 6:38 PM, Jan Kiszka wrote:
>     > On 21.05.19 17:55, Ralf Ramsauer wrote:
>     >>
>     >>
>     >> On 5/21/19 5:09 PM, Jan Kiszka wrote:
>     >>> On 21.05.19 15:45, Ralf Ramsauer wrote:
>     >>>> Hi,
>     >>>>
>     >>>> we have some issues enabling Jailhouse on a Intel with a pretty
>     new CPU
>     >>>> (Xeon Gold 5118).
>     >>>>
>     >>>> First, the CPU supports PKE and Linux will enable it (CR4, Bit 2=
2).
>     >>>> Jailhouse won't start, as this bit is marked in X86_CR4_RESERVED=
.
>     >>>> Didn't
>     >>>> have a deeper look into this on how it affects the hypervisor or
>     >>>> allowing it needs some special treatment, so adding nopku to the
>     >>>> commandline will keep the feature disabled and suffices for the
>     moment.
>     >>>>
>     >>>
>     >>> Known issue, see https://github.com/siemens/jailhouse/pull/23
>     >>
>     >> Aah, I remember that discussion a month ago...
>     >>
>     >> So I guess it is okay to allow this feature.
>     >>
>     >> What would you say, is it better to use a configuration parameter
>     that
>     >> indicates the existence of PKE (as noted in the github discussion,=
 we
>     >> should only respect that bit if available), or online cpuid
>     discovery?
>     >>
>     >> I guess the latter one is a bit against the philosophy, but much
>     simpler
>     >> to implement.
>     >>
>     >
>     > Checking the code again and the comment I wrote around it, my
>     remark in
>     > github that we would need discovery was actually overkill: The whol=
e
>     > purpose of X86_CR4_RESERVED is to filter out future unknown bits. B=
ut
>     > CR4.PKE is no longer unknown, and it is apparently safe to allow it=
 to
>     > the root cell. IOW, that commit was fine (if it had been submitted
>     with
>     > signed-off here).
>     >
>     > Jan
>     >
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/CACkfA5tm2H-LeU0MnQWM0TZG=
OOoeSjuAY8FeRNRODQCceJr-8A%40mail.gmail.com
> <https://groups.google.com/d/msgid/jailhouse-dev/CACkfA5tm2H-LeU0MnQWM0TZ=
GOOoeSjuAY8FeRNRODQCceJr-8A%40mail.gmail.com?utm_medium=3Demail&utm_source=
=3Dfooter>.
> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/909bd5cb-de56-4cc7-c435-303893ef22d6%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
