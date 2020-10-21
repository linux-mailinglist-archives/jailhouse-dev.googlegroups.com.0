Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBU5DYL6AKGQE6Q5T7EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5F295323
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 21:53:56 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id 33sf3048635wrf.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 12:53:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603310036; cv=pass;
        d=google.com; s=arc-20160816;
        b=0Q+crSRLkiI2ESZuHioJz9zw0RNtTtCMe9oOtC20Vx5dpcvtpgx2z5akSrX0NPSiZN
         HGAGoQICu0asJ5HX7c3k4Vcyh8agaeNUSZelm9AXC4wdsc/vw32CnMFotOJKWpEciiix
         wMpe/hDlojcDBFWeyb/TvES6xrxhZtSKHQPSBsb4xXydeAyFiPk0k0ult3xUG4RYJUB+
         2OfX/XYxu/vcy8DVnb+0x3ALWrnUYJyeoE3ZZmRjlB0lRg/2qRZo7+zDOWw8+4fuktQj
         oq9+w7P750nHob9GHXHo+YWYgsSscrJL++uXrXe9TQDvLqQYgzjaORqwxdIvtoo2OpsX
         9tqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:references:to:from:subject:sender
         :dkim-signature;
        bh=Y424n1ZyPeG2xdguI+Itx95BVtnO0Ss5wyQV2+JtUPw=;
        b=p+eJWh+VKdIIgZz2Ji8rpEaThfii/sW7w4GeLYuoOaV23SN4d5SsFoHxDNOEJHnUpE
         qB4Y8mMesf0tunW4GYZ2lmaeN8jE1X7XW0nrmJ1Dt0uo131A7K+lflO+8iaM3D3FyYaj
         m/lzs4S+Y3Yz7b1Ut5zHK4xSUOcwfmKdwfPDkyrAHrlQvdh5ma2CgillYRNQvN/Gnnel
         JwBUfeItfs7k8Igl2ACcCBR+LTKL11MJHJjqr1QveZVNfGxx3m8zwlcoZiZsam34LIKL
         mat5Zdg4QjrWXhoU29NM8yaEdp6dm2DH0FqQ0k5DdH7B484kP014IhtN11KXxuHOwGxV
         A4sg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=lF6Yg4kL;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Y424n1ZyPeG2xdguI+Itx95BVtnO0Ss5wyQV2+JtUPw=;
        b=kW8uPE1quVT9VpcnbNf2jEfntezuhCkUX6tUiNfZf1uUPdnai7BqYbK97EXn94yauf
         e5E5xJa/1HJzoiIhbFQAvWAObrqf/un5EAUEIpU4ETp1cr5g/Y9SDJcx8GGgRJvDkYFP
         qMmJWB2dtSil/MamsgTFysSktFNBxj1xRb6TweYqzLfPYBlJ8qIyZPdS8Nn3AtXxrM53
         NynSaSv8VtOmO4FWQnVO0ArLZpOSgCClpFZU8JvXyGh2SPrCHBpVRflvKfecxNzTEM6B
         fRb3pIJzn181ngClw8Fi+wrY1xLhP+qaSZM/taaZia1vNw9cuOx8d5EJUoAImGH5D3Pe
         dtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y424n1ZyPeG2xdguI+Itx95BVtnO0Ss5wyQV2+JtUPw=;
        b=NT7kvAUQVgpYn4XR/r2H2ikZyCc+HEhTs8kDoae8em/ii60s1JikONOCYKm0gTqtR1
         2wCg+zskACb8YqWX0emHguuMYfB9CUpjl4dUftTEs1DnpQBjOnUyFCGLQpxHyz9dQNoG
         xReOJoZu+OU4g4eyYTnw88BbbnT6H7WR8tNx9r0lFLAQwFGqc6Fac4BxSHMoRKNS13fk
         2JaBQGi+uWLn2X1VnBDfaIosxb/FyC4EHFGYm76bTgNJ6pLrv0OoNacV16mqTJJZvANQ
         PZVM4Rtwms7zHxTT8S+8Iz+sC60phbAiFPjn9DWDYSQfWgZCu6UtJ+yftOnJ7kVhfbuS
         snJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5302O+nOfJAXwknhUgSFX8luxZOAFvLA2ur7h3ymDQQkdcBQ0LJP
	vgN0oVY/F5JcBCjob71ldE4=
X-Google-Smtp-Source: ABdhPJwvLZ+Rbk0n7yh7X+IoI/kNO05rBcwOv0KzhFPDuLSMbe/oHNP/XThz1rT4fNVPP7pCtM7q5Q==
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr6912429wrp.394.1603310036061;
        Wed, 21 Oct 2020 12:53:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7d02:: with SMTP id y2ls528345wmc.2.canary-gmail; Wed,
 21 Oct 2020 12:53:55 -0700 (PDT)
X-Received: by 2002:a7b:c250:: with SMTP id b16mr5345827wmj.161.1603310034976;
        Wed, 21 Oct 2020 12:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603310034; cv=none;
        d=google.com; s=arc-20160816;
        b=lQQlQPO5o73UyDe2hW24GGxSkCy/ZYMkQotXWTWzcaUZsK1zBqfeCVjEM/LyESE8ON
         nMwOh/ekqmndoCtQHYPBRaGGBDmuXxVp4+a3Zlv/XnO/uTKKAt8WAF18doAitslmzjEB
         INC3R0MEMaeeN/rl9HU0BJYNA38BiGFeQUgYYitEL3G9+wSnU+RGdKdu5JSFhWupsxTD
         A4E6FRCWoV2U9J3AsE8Zryx4D1SLmu/wG6+qDeNSRnMthm1RVAfM8mh0TJUcvmf1+MN/
         BMJFXFZZQ0xcTM+lmeuSM88IEroZ5KPjBxuLcH/OXVhgkZgSgxN2mrh8guHema5RWIhE
         JeLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:references:to:from:subject
         :dkim-signature;
        bh=GiM00K19R0MZQjn2rB5YiZ0LTAaHHJnZxMvt9vd/9Bs=;
        b=hJMljWctrgiUm5D02y6PLbFdre0HwWRkRfzAMYw+xmhgVkYoX8l+O5GpKv6d6sjWV8
         nBkTkZ5Ra6+c+yxsRkjsPOE2Mfi4xjvDdPnNMY4KrVj9jSAFygEKQs93dQyPHIIGBGZu
         QETWIzgHOxEm23a1jrj69hXYuEy3fvGQQDb2xnZ4IXtxj4KbfTF5vYHey2HXQwBRhkb8
         yUfcRsQUfWXPdEZuy7CrDcGalQ3xmXDFL7Y0Cx8hsYvRRVRU8iQ3pEAqPKxxQ1LdplJQ
         RfLgzgA/Zmo0zUA0E0G2Qaw2qwj/Vu1o2W9DovM+lb7Ojc8gijj8/RrDJsS7Ve1fXUdU
         Qx+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=lF6Yg4kL;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id f144si105607wmf.0.2020.10.21.12.53.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 12:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGh5G4FT0zyTD;
	Wed, 21 Oct 2020 21:53:54 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id u3x2-dVYSwWZ; Wed, 21 Oct 2020 21:53:54 +0200 (CEST)
Received: from [IPv6:2001:4ca0:2fff:11::2aa] (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGh5G0lTkzyT9;
	Wed, 21 Oct 2020 21:53:54 +0200 (CEST)
Subject: Re: [PATCH 01/26] hypervisor: add extra warning flags
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <20201021145404.100463-2-andrea.bastoni@tum.de>
 <3ed6ecf9-900c-6dc5-9a16-900bfeef891b@siemens.com>
 <07653995-e5e1-3857-099a-a45fd0194b13@siemens.com>
 <fd0aecbc-2650-7df2-f113-eae7ec85da7e@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <d794898e-1827-e436-e498-de18d620981a@tum.de>
Date: Wed, 21 Oct 2020 21:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <fd0aecbc-2650-7df2-f113-eae7ec85da7e@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=lF6Yg4kL;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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

On 21/10/2020 21:26, Andrea Bastoni wrote:
> On 21/10/2020 20:44, Jan Kiszka wrote:
>> On 21.10.20 20:43, Jan Kiszka wrote:
>>> On 21.10.20 16:53, Andrea Bastoni wrote:
>>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>>> ---
>>>> =C2=A0 hypervisor/Makefile | 4 ++++
>>>> =C2=A0 1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
>>>> index 5322b5aa..41bf99f3 100644
>>>> --- a/hypervisor/Makefile
>>>> +++ b/hypervisor/Makefile
>>>> @@ -31,6 +31,10 @@ KBUILD_CFLAGS :=3D -g -Os -Werror -Wall -Wstrict-pr=
ototypes
>>>> -Wtype-limits \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fno-stri=
ct-aliasing -fno-pic -fno-common \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fno-stac=
k-protector -fno-builtin-ffsl \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -D__LINUX=
_COMPILER_TYPES_H
>>>> +# Nice to have: -Wcast-qual -Wpointer-arith
>>>
>>> Shouldn't got here as comment.
>>>
>>>> +KBUILD_CFLAGS +=3D -Wextra -Wundef \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wnested-externs -Ws=
hadow -Wredundant-decls \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wdeprecated
>>>
>>> Should be merged into the assignment above, no need for splitting it up=
.
>>>
>>> However, this must come last as we have -Werror, and you are now breaki=
ng the
>>> build.
>=20
> Yes. I thought too late that the order should be reverted for next.
>=20
>>>
>>
>> It could also come in pieces
>>
>> =C2=A01. fix nested-externs
>> =C2=A02. enable related warning
>> =C2=A03. fix shadow
>> =C2=A04. enable related warning
>> =C2=A0...
>=20
> Yes. But Werror should be added last then.

I mean, it is a bit strange fixing a warning without "seeing" it, but yes, =
it
can be done.

--=20
Thanks,
Andrea Bastoni

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d794898e-1827-e436-e498-de18d620981a%40tum.de.
