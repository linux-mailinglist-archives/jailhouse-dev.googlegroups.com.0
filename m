Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBCFOY6YAMGQEZHCQF2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id B382A89ADA1
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:13:14 +0200 (CEST)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-dc6b26783b4sf3986064276.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712445193; x=1713049993; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qAXvjAx3PlFW9PUeeojLR6s9LePhis1eywgrmfnWCFg=;
        b=OS+npryV1f47PIqGswyR51e1rKtpB6i6xeUmqcZ/Z6Lp+MrXZZTl0IoCPT+jBU+q1M
         JeYJs6kssNCajjTa8yKiDqeY+2sM/ZfbrApEmRKt+LoCrUO8FggK1OQUhTrcI4iaeqkQ
         PpHMtuxh94VrMnZNPHniO/ZW9SPIY1ONvj5Idv8quTCv6wNtQK39/EekP69Edog5De6f
         KpxabWk5XIuV5yG7SbE8OA0mmvK3LTbMtnxoIHCfR92trwsUQnEinP4DpGxJ+VCWwqk1
         sz6XSLFiJ6ZISewmlq8OCrwKLvabCvm5BrfJVt33mg6KnkzpkdBrCi4/Ez+KkMNJ36wM
         bc2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712445193; x=1713049993; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAXvjAx3PlFW9PUeeojLR6s9LePhis1eywgrmfnWCFg=;
        b=SROVq2unRP7ivh3itvTZGkVHfcGgQyUEU7yE7lx7djaXrZulaohkys1tnImVO44hOM
         uwKyvFRaL4IkZuzqZzTRYrMJSgx4atkeZ6NlHvQy2k0ioUmnPLYBfASez7PWWiY0NrmV
         rM25B40nVThjamPwz86AmHMGqcEIynW4XOkx+TMaCF8wUWxc4s+j+yQ2BcLHqMdiChBW
         gi5KRdKBKsLv35ee6g160vjpepYSP36Kh79ZA4ii9e19iX0JLVjTiLrTHVo8JXJZp8ds
         TNeKwynQx8ARPwMY9tAji9UlQATgnSEeHeX7ek/iDA5pyMI384FoQH5pysS2zmMU5sLg
         lwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712445193; x=1713049993;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qAXvjAx3PlFW9PUeeojLR6s9LePhis1eywgrmfnWCFg=;
        b=EHM+KZA0GF0txEEHFKgDxabTj8noI7Qyj4JJcXyqvq15sI2h51iFGz6HO2iDdnczmm
         G6YZc96nP5wdmrD2rcFmqJ6xwO4rIlqOG7VxF3d89FOeE8yhci8FlK1C7HlMEIW9+EF1
         ItZa2yrbD+iBp2GLwSngbPXd1dNMZ2hUsMK1/fwK9dqJM/CUIpMpzejKA8MuTb2Ic7Sj
         46AA0qyFxex3Oht6+eExB27w5JM4yMQlySeWbWqe6F7CZttEG7h/HoTXter/t/9GiTTd
         uY32EghmIVawDOU4ruVGgIjk4JLBAXK0/4HRmD25I6miF7UFuq0JMK4uR4EkUKpgYcNm
         rn6w==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXPov9G71peKDgUvGdGxmRhPfviZPlscHEC5HUonce/dwj6M/8neE8c8qM0VoXZw7pZPoLD5j0X1p42fIq+aZU5o7S92HPp+3NS0ss=
X-Gm-Message-State: AOJu0YyR3VhWf0Rj9Vg/qUUg6xGwYVbxOVSEOxBs7tfsnL/hAj3AJDbb
	jfHu+OyalrBNMfxY5/Myz2YZh558PoDkKIay4vxB+bLGuohpcXuk
X-Google-Smtp-Source: AGHT+IHJu0FoimDSiT4UeaHKX6290QZLKURLstiTSFxq4hmiuGkSRvDW5xdRfmv74mshMvlUFPyWQg==
X-Received: by 2002:a25:add4:0:b0:de0:d45f:7c5 with SMTP id d20-20020a25add4000000b00de0d45f07c5mr1867230ybe.20.1712445193514;
        Sat, 06 Apr 2024 16:13:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7145:0:b0:dcd:a08f:c83f with SMTP id m66-20020a257145000000b00dcda08fc83fls1541393ybc.1.-pod-prod-08-us;
 Sat, 06 Apr 2024 16:13:12 -0700 (PDT)
X-Received: by 2002:a05:6902:c09:b0:dcd:b431:7f5b with SMTP id fs9-20020a0569020c0900b00dcdb4317f5bmr1672942ybb.0.1712445191756;
        Sat, 06 Apr 2024 16:13:11 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:13:11 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6a93ad4b-c635-4cbe-b290-7408731ad9dfn@googlegroups.com>
In-Reply-To: <CAJjqWDkfmCDqMWAeRy0Kj5GRk64CcZ9ebPFUzHSUbbU+rH6j7g@mail.gmail.com>
References: <CAJjqWDkfmCDqMWAeRy0Kj5GRk64CcZ9ebPFUzHSUbbU+rH6j7g@mail.gmail.com>
Subject: Re: Hello From Mrs. Meijerink
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_94750_1465077714.1712445191091"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_94750_1465077714.1712445191091
Content-Type: multipart/alternative; 
	boundary="----=_Part_94751_1005987159.1712445191091"

------=_Part_94751_1005987159.1712445191091
Content-Type: text/plain; charset="UTF-8"

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6a93ad4b-c635-4cbe-b290-7408731ad9dfn%40googlegroups.com.

------=_Part_94751_1005987159.1712445191091
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6a93ad4b-c635-4cbe-b290-7408731ad9dfn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6a93ad4b-c635-4cbe-b290-7408731ad9dfn%40googlegroups.co=
m</a>.<br />

------=_Part_94751_1005987159.1712445191091--

------=_Part_94750_1465077714.1712445191091--
