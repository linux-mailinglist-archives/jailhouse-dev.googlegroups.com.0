Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJGK76AAMGQEU25IK6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id B73CC312477
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 14:03:32 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id h18sf10726963wrr.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 05:03:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612703012; cv=pass;
        d=google.com; s=arc-20160816;
        b=i/Q7pfLq4bYTpN+6YTlQhdl3+QlNpnk+ODjjwSdzt1RBJL9TX5v/zbwxU4BFY9JF4t
         oWioDhtdf4z3g/yGs1zp1Po/C3B1aFjNCcE63Wo3fjwJFVT65rVkSxMOclTcOPtSAKqC
         lnVI2fUTp23T867ZeVXP/DSBGlxno0Klb1DPOeg5UKshRX74j2t9dKHhR2G6EDKXpuB2
         eXRqKPl+Rsk3rgFUr9uysGv1YI/wd5MxytdKU1gQi0psNqJ1mjValAYmk55mdOriw70R
         XnGOLi5tjiKfgK3wuM5OvD6a1xY+oB3utDZ0b1S24zIykPEuSDPsKsfENZ4K4qYNp8It
         NGuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=abclXOOjos/2vU3kf6sx9hxzt8uced6gPHspjAdvyK4=;
        b=TaXVdAe7b2nO6zOuA3bPwrgUrlHoojqqAHmep/R7GpL9uSk/hT76O/1LTPidcNe0L7
         4NyyTWKc0ycWRtLgqEX+nCGA9TKbtSw8ePCrUaFpWchVj7yVeiw1zqsBmOYF8/Ru58Iv
         C0xknuxDEJ8FwDUoTc7gUx0U2/OE5FwTXnkEnr9bqJPy92Ucd0Mmlr259FpLHE3ubTgI
         q/DL/z8QPSreq5ByP+HaGwd7Dg+9UYCK3sjE3Iye4nu0TJETl0eb4eumR/SaYAyw9Y1D
         18HkUV/lN4YO5iGSPyXHEl1hhntfdEkBMsWfluXvySBX/fLkpRH8cthtVPhSda1beSDM
         +63w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=wXLb0LUT;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=abclXOOjos/2vU3kf6sx9hxzt8uced6gPHspjAdvyK4=;
        b=kXRtDt0pe/bjwfjGaJyJZngLs310GTOU+VpAXvLw7BWlA1DEztPye7x8+2JRekbKWS
         hu9HV+RtqZRpXSQFtnRwdbmRG+N8w2hxBAtrLNneuqbP+g17zWLsxtaE+Pu1ugkcVuit
         vmUX/z4rdhwnDAhZxYOxXR2Y3Hw3X1AmrOIIL3MExGY2pbNL3hD/Tlw+vUCSg6kCgEOA
         /3Oyi548iqhDji3V5dBLednHcIIk7IlIuJg45VWsFAM9/NR6ddHGZWuVeo5sEaUoEBo4
         /dhtMZ6KuiB5h8CaEEbAGhBKlrVy5QSRCXixJQvvzae7GfkBYbPURO0qLhOQZUr02X6f
         y4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=abclXOOjos/2vU3kf6sx9hxzt8uced6gPHspjAdvyK4=;
        b=WLloTD5BWOnFBhe1HHIMNT+dpB2irE3bwfyc6YOMk2ffNyRTyW2TZiPyEhqgW4ooJk
         1/81ZAhxEBxtHsh+xLqBYbbKow3Y97ze9OZ8R9Jvmslxm530JHFETpb2Du0m2HMRkqdJ
         HJQGhxlBJcXv18Pn/wdWMl7ulWVW7ssbnUJm78EmhGM8rRIkIk3Fr3FCUq+/ZKpPOvgr
         VRKuUVmByUfhbA5BjExZZ6WXlgO2fDonZd/i21z7Tkh1bFoZCPvWGNE5Iey2Dxg+MBZs
         OBrTmx4uSSvZhyNF2uJXUWmUEPt1BrAgp6KDgYxjfHYpw9WLoK2aJNOwsbzJJCDUGFmH
         sSOg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ZQLoC2PlIOqt3sqsBWdEx+ygJSXVMvEVf4KEQlzZVNMF0JyOC
	SlIrIBGx70b+tkl2WqJYaRc=
X-Google-Smtp-Source: ABdhPJyp5ZLtDy0AvVXqL6/91e0u/unAolAbzcTgel/iBJElmCaGaUDN+SXLTPffUpsB03oYiPTUnw==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr11261624wmb.0.1612703012374;
        Sun, 07 Feb 2021 05:03:32 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4d02:: with SMTP id z2ls258893wrt.3.gmail; Sun, 07 Feb
 2021 05:03:31 -0800 (PST)
X-Received: by 2002:adf:f307:: with SMTP id i7mr14646182wro.367.1612703011535;
        Sun, 07 Feb 2021 05:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612703011; cv=none;
        d=google.com; s=arc-20160816;
        b=UPm77UxKNrfiyb19uL0OaDJ1tdUVIkKbwrdsplAOEHGaPiyAeHHx11qpSF8LkZ+rfV
         gBCu1aVtziv0tdxekleQLqGVDHvJjT13Ea5ojzF+2afDuURwh33vRUyqYbokjVRVUFuJ
         lzJSU9RW25VMeOX3yK4yneZhyh05b6NEY8Uy2kzJ6virAV82/gqC2f4MwcuDvbX2Dr/V
         iwSZ98IcViFjdvo/lDcBUH1fExjXGMBWf2kMH6LuHEWI8JeApcukcJVlctSbxrY7QGjk
         WrKFxaDHe3wYbLvR3LSbunEZmUjkR3TJA57AWxjkUmhYlj0YKLrY6YJJce4sY13b9dey
         po/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=ZD1i9fpqzEREOPSjFUvNBIGdZOprb/RYD0RTa0P0y6I=;
        b=uvITZnx6kRQJ4WEbwEHQkscYqHBhty1oCMDf46U7mtWPoIWTH63SWit0R/j98oukNC
         6G5Dw/cGEPHSmaBRPHNF1BHq+LY7JA8xVI3YHSLyBFtXK0H6kuVU5xMjXlCkriQFSa0V
         diwyZTWcRHhOt4YtyA1w8YsyE17zNNbFXbxGkQD9YXFolr8DXFIOt8arptDeVWMZtSu9
         sK39V+eqBZ1fdCjsC1P0RNNhis1hcQAg9twUAf5/E27fSIe149QwSTNyYhqoh9UiOXxU
         2OkKu5MbXJHMrbUGKtT65Ni02ftYwiXnbh/qBcvMSnUVuimB3O0OsLEA6yM6qhpT8Aar
         SWYg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=wXLb0LUT;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id w7si472949wmk.2.2021.02.07.05.03.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 05:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DYTqR1KtHzylh;
	Sun,  7 Feb 2021 14:03:31 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.874
X-Spam-Level: 
X-Spam-Status: No, score=-2.874 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	NICE_REPLY_A=-0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id HhE9_9T7A1Oe; Sun,  7 Feb 2021 14:03:30 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DYTqQ0ZTnzylg;
	Sun,  7 Feb 2021 14:03:29 +0100 (CET)
Subject: Re: [PATCH v1 00/23] Cache-coloring for Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
 <8e7872cb-ea47-9c9d-3240-f687b1ab698c@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <7d28fae1-29b1-7957-5219-11b11a572681@tum.de>
Date: Sun, 7 Feb 2021 14:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8e7872cb-ea47-9c9d-3240-f687b1ab698c@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=wXLb0LUT;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Hi Jan,

On 07/02/2021 11:17, Jan Kiszka wrote:
> On 25.01.21 13:00, Andrea Bastoni wrote:
>> Hi Jan,
>>
>> Here a proof of concept for the cache-coloring with/without driver appro=
ach (works, but hasn't been tested as much as the old version, and we have =
seen at least one crash in our tests, but it should be sufficient to have a=
 discussion about the direction).
>>
>> The patches until 0018-configs-arm64-add-coloring-example-for-qemu-arm64=
.patch implement the previous coloring approach (+ bugfixing + qemu-arm64 i=
ntegration). The patches from 0019-config-always-rely-on-the-availability-o=
f-way_size.patch are the proof of concept to realize a colored jailhouse io=
remap in the driver, keeping the same logic between the hypervisor and the =
driver.
>>
>> The "get_bit_range()" is refactored in a single place already (0020-colo=
ring-extract-get_bit_range-logic-and-remove-offs.patch), but the main logic=
 needs to be replicated between hypervisor and driver [*], coloring.c doesn=
't get considerably shorter, and control.c gets more complicated because we=
 need to distinguish when the remapping is colored and when it's not.
>>
>> Most of the code reduction comes from the removal of the cache_layout au=
todetection, which is "debug only" (and could have been removed in the prev=
ious version as well).
>>
>> Overall I count for the previous approach (patches 01 - 18):
>>  42 files changed, 1337 insertions(+), 121 deletions(-)
>> For the new one (patches 01 - 23):
>>  41 files changed, 1233 insertions(+), 127 deletions(-)
>>
>=20
> Thanks for the update. I think we are moving forward. The diffstat for
> the hypervisor (with include/) is getting closer to an interesting range:
>=20
>  32 files changed, 721 insertions(+), 122 deletions(-)

Thanks for checking the differences between the versions.

Which one do you mean here? The previous version (01 - 18) without cache_la=
yout*
is smaller, roughly

 30 files changed, 710 insertions(+), 117 deletions(-)

IIRC we discussed already that cache_layout was to be removed (not even
"DEBUG/NDEBUG").

> But we can still do better:
>=20
>  - make non-colored operations the special case of colored ones (e.g.
>    map_uncolored(...) =3D map_colored(all_colors)), that should further
>    reduce duplications, both in the hypervisor and the driver
>  - make sure that only the calculation of color bars' start and size
>    is arch-specific (where I still think it belongs to arm-common...) so
>    that iteration & Co. can stay in the generic core

I think this is a larger design decision than just coloring. I can integrat=
e
coloring into the paging and have the non-colored version be a special case=
, but
this means extra complexity for all situations that do not require coloring=
. I'm
not talking about runtime complexity here (paging is likely irrelevant at
runtime), but documenting the code for a possible certification (if this is=
 of
interest) becomes more costly, for something that e.g., on x86, you don't n=
eed.

The first version provided a way to identify a coloring-feature (and the
corresponding API) you may want to exclude from the scope of a certificatio=
n and
from a possible pre-certification cleanup. If we integrate the coloring int=
o the
paging, this is no longer possible.

>  - pull all coloring unrelated refactorings to the front of the series,
>    e.g. the panic things, to allow taking them earlier
>  - avoid needless static inline, rather provide linkable stubs on arch
>    that do not support an implementation
>=20
> In addition, some consistency checks in jailhouse-config-check would
> probably help to make users' life easier. Or may even obsolete some
> runtime assertions.
>=20
> Jan
>=20

--=20
Thanks,
Andrea Bastoni

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/7d28fae1-29b1-7957-5219-11b11a572681%40tum.de.
