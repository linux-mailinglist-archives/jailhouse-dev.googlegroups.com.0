Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCHWULXQKGQEOUWQB7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A601113CCE
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 09:08:41 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id j13sf1161066wrr.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 00:08:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575533321; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ehfr+u8pVdZwUIU/ORjcFLlvRvrwJq4WBaqOv3q3jyAtB3tCXIOhXMqRpLS6fX0EMH
         8ZqNAyhTU0b8xMCycz/dbfC4ln7h6znvXEIwGVcGSQMMv0h/NQIx/Zw/PQ2860P9RtXw
         avNrvRnybAGoKnyy3QeQz3jFDzBgtaoGDBA/YNCl0iep3pgHX+/Ivrn2xQEl9OugRu3d
         vwojr+rRie+SJzm4ljkVs90IflVwJXc8soecM5R4hqs6IrWK0yI+YyG518AbQFFSS1YN
         +3R0hCv5jKv6XMk09ZStrAI/ENwN33lW328LQ1YLK8yNxlPlT2C1/WpyugkNKBZ+vmWj
         X/tA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:cc:references:to:from:subject:sender:dkim-signature;
        bh=8sqesoDA776X2M2vV9F5BLq6iUWEh6pEoTrxeVV3tTI=;
        b=cxEk2xHiXhGwwApIAR9NxqsA6gc7zfyk7N4sLuQt3W75A7sZ8yX5yFjuuQa3QwbAsc
         QrhDMHNppalbq+DGXIdUX/3FqTjbTaw3m//u2YqisDS40UOUZ6A1Mu7/qKj2sZ8kBLW8
         ZI6aXViRkigKNWvGidBRd45gAVNtZfhqky2sI0AD7zEb8oYjRIGo3f+iEn7Ng50gAEWx
         ki9v1ltNvsRjasXuEMGqg24k+WOSUv8L3krfefXeed2UF6/UXE4ce9ErlQ3WDb4fS1aV
         cMH/TTFqiO/zb7CjIbtthPM9CpUKYWZ49Mxo9p8Z4GqRttQEqHuIyTwCe+h6puMNuuCd
         ALrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8sqesoDA776X2M2vV9F5BLq6iUWEh6pEoTrxeVV3tTI=;
        b=ILQrKng1YrMkyFvhNqp7onrtoqpPzWWWK7RxZCgv+Oz+HC/S8LqFlYti4lnQmCKQ6E
         D8cvOuS0AB7GUNrBkpSKrLIeeJcH9Nn8zAKs/rYbltiXVmCaJELmU5Z0GtBjwIS+E/Gt
         YPD/LwVBesgkqRnM8PHinWGpb2CcArzEu6xIh+buMm4MT03LAMhOC58+dhPoYwv8jtjf
         4Z3AXjxqcVzFAN2X5Hp1iwoa2GzSxQfLHYeEGyEMMAOXGKDN/Tl0QHNN5UAUIUMnNbb+
         6qaeoU19PQO8Y1WoTZgsssQYfDxwJl7/qHus8hdeMKKQ4bCq0lyWvvzvlPzK0lbkgndt
         vvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:cc:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8sqesoDA776X2M2vV9F5BLq6iUWEh6pEoTrxeVV3tTI=;
        b=T4qo2prNoJTc5xLwfaTJDax5J2R7GRwY4ZxJu0KHZ467d10DwxwJkTdfOQDGD6Absx
         llMbX4stKWgSHWwjy2dIIweMPs1KJ3+5J2lwTbSL9ey+e5owTPMJpG1CBQV8o8DAMMhd
         0iJI4XaF4RxbEPiMHBH57iNK8IehNGoK9zHtxyV/nwBONCE3+g4dClA0dwSbZThvCT0v
         OJzLc6X92m/CYXQLD0uivX6kxVCKIc2uCvGXZQGQNP8ITXuuThL81esikvu1Rpv/Km+h
         rD6lWWeYL/vXSQZmr1kyq4GdlhvbTEP3xEsv1A/bMoUnTs1iK7kYujAmcRl0WkT5jlYN
         cGfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV/9fRK6dmk8QgI9pTOcsMuchUJml7M2vKqNbrxa+rTJSfFu4ka
	F04Am5jEOfFlzytcLIiBWcc=
X-Google-Smtp-Source: APXvYqx41tnpEZGnjxda0l1VzlAY8P0l7gVtHUnZHjZbs2pjLdr/hPA2AQJV9fliac0AqKJ55URqEw==
X-Received: by 2002:a05:6000:1047:: with SMTP id c7mr8856211wrx.341.1575533321050;
        Thu, 05 Dec 2019 00:08:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5284:: with SMTP id c4ls926154wrv.15.gmail; Thu, 05 Dec
 2019 00:08:40 -0800 (PST)
X-Received: by 2002:adf:fe90:: with SMTP id l16mr9088727wrr.265.1575533320412;
        Thu, 05 Dec 2019 00:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575533320; cv=none;
        d=google.com; s=arc-20160816;
        b=LkkR5Wuq05xdqB+uDXmH8FjCi4l83FVEQ/elKQ0c1KGHNNUmtpXxpoaoVyHeKyxhDz
         PntPuYPjh2qg1lL1f0MTj+FitrDLbvhBF6rm9BQFVij7q2S+Yt0nstFsBoIw9ZyF/LyF
         22E9RmdECXWjigg62kx1nqJyDoK9mNW9oB8zBvigbUuHwWSHCdWcm8HESEARwt86AbyO
         QU1k8n9TsKWW5uHjVGjaZehWfoed71+X7QjLe9aL1Owd5Q3y3p2ZxMes4Sl24c0OHC6W
         wT+zdZF7VimhVph6WpaM0d3zoLlBJ5OqGtaLrn1wt1TnivVUBJfM7ChUzHdSzE/4NK9M
         BcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:cc:references:to:from:subject;
        bh=FuzixZm2MZDm4jZsLW115XIPIZG2DHNGZ+anL8JQAlE=;
        b=dnPPTD/TmkdL4i4Ulb50VHuUKw8n53642QpX8f94zjg70ezlM8L+EQwzFGeH7Q0S2B
         qIX9HVZlbvMrNPEEfAnLIW2pYkp4sbDa1Iga/g+ZPPBVrSjr1L9BHCvtEfbCxiLKgjxa
         5JhsN4bxwpO2iq7jMRcoYztajCzBLs/jaRW6ViPu2THp45gwvCapctfLvX61z4TnjlKy
         J/4ne7us7mdDSiL5YxEQhAjlQkH3A/VK6CiiprDIeN3VpNBRT9LjatzMPIiDFzPMIQ58
         O56tc4E+rDKsirjLezACoNcapX2AxeNzcobC5cOVW5ouesqa5ozFa/fWUz8sTnTCK/rx
         cbNQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id k189si420362wma.0.2019.12.05.00.08.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 00:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xB588dOI014093
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2019 09:08:39 +0100
Received: from [139.22.77.67] ([139.22.77.67])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xB588dE6005670;
	Thu, 5 Dec 2019 09:08:39 +0100
Subject: Re: Zephyr as a Jailhouse inmate
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Mani Sadhasivam <manivannanece23@gmail.com>
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
 <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com>
 <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
 <87131459-2a1d-91b5-21f5-3dfccd49fa81@siemens.com>
 <CANBTL1XSjDtz5OFuMUXSM0R_=nsESgHH1WFxRk9qaA2uCy0Jww@mail.gmail.com>
 <0660d2b8-b8e4-fcf2-69cf-068b9fc4a622@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <a27fdb7b-0c85-d967-7c8c-81d26b0157b6@siemens.com>
Date: Thu, 5 Dec 2019 09:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <0660d2b8-b8e4-fcf2-69cf-068b9fc4a622@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

[re-adding the mailing list]

On 05.12.19 09:07, Jan Kiszka wrote:
> On 05.12.19 08:49, Mani Sadhasivam wrote:
>>
>>
>> On Thu, Dec 5, 2019 at 1:09 PM Jan Kiszka <jan.kiszka@siemens.com
>> <mailto:jan.kiszka@siemens.com>> wrote:
>>
>>     On 05.12.19 08:14, Mani Sadhasivam wrote:
>>     > Hi Jan,
>>     >
>>     > On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka <jan.kiszka@siemens.com
>>     <mailto:jan.kiszka@siemens.com>
>>     > <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>>
>>     wrote:
>>     >
>>     >=C2=A0 =C2=A0 =C2=A0On 02.12.19 19:43, Manivannan Sadhasivam wrote:
>>     >=C2=A0 =C2=A0 =C2=A0> Hello,
>>     >=C2=A0 =C2=A0 =C2=A0>
>>     >=C2=A0 =C2=A0 =C2=A0> I can see that the Zephyr RTOS has been menti=
oned in the FAQ as
>>     >=C2=A0 =C2=A0 =C2=A0> one of the ported OS for non-root cells.
>>     >=C2=A0 =C2=A0 =C2=A0>
>>     >=C2=A0 =C2=A0 =C2=A0> Is there any reference code I can look into?
>>     >
>>     >=C2=A0 =C2=A0 =C2=A0There is x86 support for Zephyr as Jailhouse "i=
nmate". Check out
>>     >=C2=A0 =C2=A0 =C2=A0zephyr/boards/x86/x86_jailhouse/doc/board.rst. =
If you run into
>>     trouble,
>>     >=C2=A0 =C2=A0 =C2=A0report to the communities.
>>     >
>>     >
>>     > Ah, just noticed that it got removed some=C2=A0time ago:
>>     >
>>     https://github.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8ca54a=
9f19bc56a14b4a2fdadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07
>>     >
>>
>>     Too bad they didn't reach out...
>>
>>     > But this could be helpful!
>>     > =C2=A0
>>
>>     Partly. For ARM, you likely don't need so may changes, see below.
>>
>>     >
>>     >
>>     >=C2=A0 =C2=A0 =C2=A0We could probably also easily support ARM, but =
the last time this
>>     >=C2=A0 =C2=A0 =C2=A0question came up, there was still not A-core su=
pport in Zephyr
>>     which is
>>     >=C2=A0 =C2=A0 =C2=A0a precondition.
>>     >
>>     >
>>     > That's what I'm trying to do on IMX8M EVK in spare time. There is
>>     an ongoing
>>     > PR for adding Cortex-A support in Zephyr, so I'm planning to
>>     utilize that.
>>
>>     That is good news. If you combine that with the device tree descript=
ion
>>     for inmates, actually those for the Linux cells, you should be able =
to
>>     boot without code modifications.
>>
>>
>> Don't we need MMU support in inmate? The current ARMv8 PR doesn't have t=
he
>> MMU support.
>=20
> Technically, we don't. Earlier versions of our demo inmates were running
> without MMU as well, but as that implies running without caches as well,
> we changed that. In any case, the inmate starts in reset state, means
> with MMU (and caches) off.
>=20
> Jan
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a27fdb7b-0c85-d967-7c8c-81d26b0157b6%40siemens.com.
