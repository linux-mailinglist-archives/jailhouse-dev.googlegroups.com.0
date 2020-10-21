Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK4DYL6AKGQEMAOC6IQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 985CD295264
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 20:45:00 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id h8sf3072840wrt.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 11:45:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603305900; cv=pass;
        d=google.com; s=arc-20160816;
        b=pFJWphXASKQlwbltm98xXsmffGzdIgs7kfDT200gCEWfKDwPfsovZZIzwiQyyZ48W/
         gQinOi80eqAQ2uu9AsmhWh9s8eUkANCtdLAuk6QmRJd9+982vEKogL50uZvoElDvxbbZ
         PaTyL+o2rWkds6yMAgjrp/SOB1mrtBSfTUkIHYPpUccsAkiQkdJoi/MQPNNPcGwpY+eh
         IOPsFyLS44ly9VC6lpMbG9R/xQzrKWuUIF/viOSR85G3TR338VbBhs08MUHNy2+nStdy
         gytkWNGSa8LeaVnbpuJrC993mGECOjkq34Lz39XfZChwyd/9fIpxErhQBSP28O+w7w/G
         CZCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=/NvaMnUQDhB+/+7luwwOgTE8mSIW6+1VY9o53Lkk6CM=;
        b=nbRoQcreNR7AsTlxb6eipzTEdmrh77m8NDyesSTcO4VJNR3w8b3mGFcQdpXwtWFGxO
         +1JeVcbNR1c8KuG5decq8cS6AHchrm/fL0TbFqcRNYu87w1jk7CllYSQrsBfyzpjXA6D
         jW42+mYsB6XmMKGr9YVRL/6EciLrUhHwvkIfjyHSbgNyonvLryogqAIhhuNuFI31gQ4n
         5TEq7IpuntNe7XkgH3f8JQQErgX/U8OxCYqYMh69AatrKyBSWjKDhnkq38mKBvgRNJH6
         HeyMyul50v+0iPWoLaITlTMuaQydQgRJmbMnwZShNnG0CkK/uc8nC74IIGud1rykD42t
         ZmoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/NvaMnUQDhB+/+7luwwOgTE8mSIW6+1VY9o53Lkk6CM=;
        b=OWQq1y7CJEUpRUvbLzFFv66xm6QrB/93U+ToT6WSK61MmBJjfKUrrBYny/bWMOUhR4
         8hNGE3yWA3gyJOkLLfK0UzSW5zfF4obY+4OcHnOR1W24zhXlrdd5gQf7sfVzeUw0QW2C
         TmWl9k+KnePGRbG7WPMobrbjkN97WJnsezihac8p7knaISZWXl5sEfHjX9hvSw6JKIoK
         dmOjoM1SEQJsyYPEcne1lpJVCaikB+axfwL8++8Z1l3Lyldldi1yESoM4oh0wmCxEqsY
         5bEd22XDZkvusc+dNwjnZ6n7Nldn+QqoUiuuEkn2IQO+rlSDwddUesjfo5iABBC63pXh
         JevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/NvaMnUQDhB+/+7luwwOgTE8mSIW6+1VY9o53Lkk6CM=;
        b=VytLOkjTmiWfof5V3MGd7ylZR9Ve2+KYdBb8ldTOgD1tiO0/5YwrE7IkIvUf1SwYxO
         qhxGhXbUJ7oWxOqgCS6trQjJ2GRtv3nkqkNOL/Jzk5x/u0eXQQQiGiZ2ngakBERrEtz7
         ImqYTTvyDAFYAXtBQO645UGJM4tUg1I3rO8BhzVT5DNdx+GWEFGI7v5jdQ5IctfV06cp
         Ha/KQmv9zPNREYF1TG6K1Hs0V+ZGbOv1g1TcDuaEvl//ln6Fy4CcySK+6cIR+9xISsMX
         4SDCC0U3RWeUrqpVXN0el2UAMN9zpMufk9qxXNg0/NRSmQuVmGuCkbQXCk+xPdLmLVDI
         MP/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Ywg/EmtnsDNDOn86KgnuM7GnbcVvmPurAdMD2oH1++b0J3EhF
	MYIdrgjfuzD72pAC85g0ZWU=
X-Google-Smtp-Source: ABdhPJw1muyv1GNzsKg6sx2JzdMv8mxNYIFavPgw3XPnhHwFpHWX5itsNRH83q4LlKOvA5E9An1Xsg==
X-Received: by 2002:a05:6000:1005:: with SMTP id a5mr6502134wrx.360.1603305900305;
        Wed, 21 Oct 2020 11:45:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4ac3:: with SMTP id y3ls839821wrs.2.gmail; Wed, 21 Oct
 2020 11:44:58 -0700 (PDT)
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr6341439wrg.83.1603305898190;
        Wed, 21 Oct 2020 11:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603305898; cv=none;
        d=google.com; s=arc-20160816;
        b=juZoa0tORo/tC21kFGiDiHN83dSOAnfW2tQcW5ptaJudmWjyHl4w96L4NytAdmQJtJ
         yKBmuYcsImvhfLnotfcPCjWuwdjm4BWw0nVwZPDCfX3HJrh9VVm+DCruHY2oUVNfM1Mj
         tT/8JcrSN7tHfR1G7X5FbtoBCEDJ1SkaDpK/ZeaAqvdEKeNBL5JRIX3WPgRx+5N54rNv
         29iJZN1sGsG+oUl6UrFifYBrH7+ZUAg7yZCTgZra9WBIDAHPafNuYmKE83/TZ6+YsfZE
         NlwmD6IQLNcndnfGdOpLd+K53GykXb7aUtfg8a4zEAXSf5peilZmh8cDUwrmGo8devT8
         0v/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=/EHfZVt5U08PklAYbV6utIt41dwVLKF2vEQZXlNvMjY=;
        b=Gb8GDmR4tYKg1GjEUqUPY305qMLOHzYCJEYdHbvNPGq65m1/BfUPXtCv15LGzM3TE/
         G9obnKmz4FJ0BfVTSHaBd+V5w5AhhOPCqt3rUzEQPETe/pzR0Lh94qgHoITGl7csOoMJ
         4Me0J8ZjN+Kicj8ya5yj1j7tXAhmoFaZvsCZaE6mFDY+hp4kKlZG/hJqSajlsJwc9DjP
         HsJ5729kPVdOzx60xGnAAVS7L6z4qRorLjZUMWnFy3bnHo2XWKC3NRyKQUOdzZ0Yqxqq
         0DqlQLPnmwZT/XjCib5OIBCRcu6rhz1Czca+S/UAaI5YYrjY4diVOKkFQGe1znAQh6nV
         Ob7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id k3si94518wrl.5.2020.10.21.11.44.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 11:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09LIivom010773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Oct 2020 20:44:57 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09LIiv7A014040;
	Wed, 21 Oct 2020 20:44:57 +0200
Subject: Re: [PATCH 01/26] hypervisor: add extra warning flags
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <20201021145404.100463-2-andrea.bastoni@tum.de>
 <3ed6ecf9-900c-6dc5-9a16-900bfeef891b@siemens.com>
Message-ID: <07653995-e5e1-3857-099a-a45fd0194b13@siemens.com>
Date: Wed, 21 Oct 2020 20:44:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3ed6ecf9-900c-6dc5-9a16-900bfeef891b@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 21.10.20 20:43, Jan Kiszka wrote:
> On 21.10.20 16:53, Andrea Bastoni wrote:
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>> =C2=A0 hypervisor/Makefile | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
>> index 5322b5aa..41bf99f3 100644
>> --- a/hypervisor/Makefile
>> +++ b/hypervisor/Makefile
>> @@ -31,6 +31,10 @@ KBUILD_CFLAGS :=3D -g -Os -Werror -Wall=20
>> -Wstrict-prototypes -Wtype-limits \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fno-strict=
-aliasing -fno-pic -fno-common \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fno-stack-=
protector -fno-builtin-ffsl \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -D__LINUX_C=
OMPILER_TYPES_H
>> +# Nice to have: -Wcast-qual -Wpointer-arith
>=20
> Shouldn't got here as comment.
>=20
>> +KBUILD_CFLAGS +=3D -Wextra -Wundef \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wnested-externs -Wsha=
dow -Wredundant-decls \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wdeprecated
>=20
> Should be merged into the assignment above, no need for splitting it up.
>=20
> However, this must come last as we have -Werror, and you are now=20
> breaking the build.
>=20

It could also come in pieces

  1. fix nested-externs
  2. enable related warning
  3. fix shadow
  4. enable related warning
  ...

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/07653995-e5e1-3857-099a-a45fd0194b13%40siemens.com.
