Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBJUT57WQKGQEKHW2WRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A5AEBD6A
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Nov 2019 06:59:04 +0100 (CET)
Received: by mail-ot1-x340.google.com with SMTP id p3sf4965790oth.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Oct 2019 22:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F5XiaV0jL12IEKtpj4gRJMVplx3Q22Tlf7UYOGYRWJY=;
        b=BCyZRa4oyOK8J2QTPf/ytlN438uAfBx1ejRKm8p09gAkTbbj5dE4/BDBm7hNFH78Xs
         K4ZQwB0gMk9ge9mqlGv55g2ThxLiX/hur7N7lvTCWLFH+IbBCKIHAwz1zvu0br2+r1vZ
         d/aY2l9LEoNsCGtCEwWtlVC6qDF/IhlOKfcNrCyuch9bifsRxwk1RMtBTNI90d6M3938
         Wy6rr6XKW5vd+Hvh9xNkS2wq7BJE5PvSglS0uWP+bxH4YIC+Z45GYTw7ggKyitTmPioT
         3t6XgIkCOvrScwBrmUbAfNUhww5KLVCFdiDicFFmi39fc6CaOaeZhoSn6ace4yS/dmJC
         tryg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F5XiaV0jL12IEKtpj4gRJMVplx3Q22Tlf7UYOGYRWJY=;
        b=tem1sLhbYFZ+FlIO0M7iG5eNaCYFvlioMDhKhiaMcBWhGgaK1g725sqe7bHC+84EFB
         sVZ5gSmeWJSjzKTpT7kwT1iUMk+iCbtRdoP4dO77CWaXzgVQJPEokUyG2iDH+47Aqwkv
         paz5D22ofi13/jDFow8Et17hyRg1kxgytsN3x+cZRHp0EfWmHuX6gHDfZsKKtl0enCxH
         p2v5gfSZGLrqNcvmAqAtCvwPRay2sq19E/QyploW9WEcf4MM7BGHFHlvhEG0Gkumyjsx
         GeUgvucCvYAiHN2l6ta/zZUD0x4Vg1vn8DeR9zWOBuADhQsFVD4InXcI5y66e3HAQ+rT
         Bxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=F5XiaV0jL12IEKtpj4gRJMVplx3Q22Tlf7UYOGYRWJY=;
        b=GqftMun5QB7upLwi+JspLHZ/v2/bdZE9V6N1d+L84sP/PsoFYajnxsG7o6QbiGWpnH
         ZUflLa80tKxQjMToQHkDpq29s071WeM69F7TJ6ZyFrZdQhTDcXxzRCoXIOp0Jivcv7SU
         V/kwPwshgvg2ZCMgMssUoD72mMDPcBc4nJEBKbjrI7c6zMXvisCQ250cv9iPBtveB+ll
         EhA9OP67b33VaP1MscNZCVQpye8tCa+PLuNt0OnR6HaTS06WN6UGUhuGSL5oUhlVEobs
         9VUAbSIL+61/rhV2xRORAGRCQwnAbpeb52f+mWLf3YyXjPa6gL67C2KN+zxQ+HXEVF4y
         /G5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWyKcTSMTeojDv0ez+0vxHrj8WQwNm9yC38tZHFw/6p764WZviR
	AagzUzfeiBhZ0VSDey4dZ4s=
X-Google-Smtp-Source: APXvYqy4VWIFCczQoZfD750d5N0BXxMc9C6VkiplOyE9+8qgWnsDPRAXgbOSbBkqXYznwVV6RjGTFQ==
X-Received: by 2002:a9d:6452:: with SMTP id m18mr7359216otl.325.1572587942914;
        Thu, 31 Oct 2019 22:59:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:d410:: with SMTP id l16ls1345682oig.2.gmail; Thu, 31 Oct
 2019 22:59:02 -0700 (PDT)
X-Received: by 2002:a05:6808:913:: with SMTP id w19mr38139oih.110.1572587941995;
        Thu, 31 Oct 2019 22:59:01 -0700 (PDT)
Date: Thu, 31 Oct 2019 22:59:01 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <255261de-a630-4790-b91c-16c569248829@googlegroups.com>
In-Reply-To: <0d4ba667-fb8f-40a6-becf-69958143de2b@googlegroups.com>
References: <01105881-d1d1-4931-b950-0b6028cd5ac5@googlegroups.com>
 <0d4ba667-fb8f-40a6-becf-69958143de2b@googlegroups.com>
Subject: Re: TSC Frequency
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_203_570993345.1572587941226"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_203_570993345.1572587941226
Content-Type: multipart/alternative; 
	boundary="----=_Part_204_66566121.1572587941226"

------=_Part_204_66566121.1572587941226
Content-Type: text/plain; charset="UTF-8"


I also noticed this.
I am working on a Broadwell machine with 2.2Ghz of core frequency.

Jailhouse get set the cpu_khz in comm region with the frequency probed by 
Linux during boot.
I got somthing like ~2.1997Ghz in that field.
The difference is so small that I don't have a good way to evaluate it.

It does sometimes make the process of maintain a proper systick frequency 
in custom RTOS painful.

----
Yang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/255261de-a630-4790-b91c-16c569248829%40googlegroups.com.

------=_Part_204_66566121.1572587941226
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>I also noticed this.<br></div><div>I a=
m working on a Broadwell machine with 2.2Ghz of core frequency.</div><div><=
br></div><div>Jailhouse get set the cpu_khz in comm region with the frequen=
cy probed by Linux during boot.</div><div>I got somthing like ~2.1997Ghz in=
 that field.</div><div>The difference is so small that I don&#39;t have a g=
ood way to evaluate it.</div><div><br></div><div>It does sometimes make the=
 process of maintain a proper systick frequency in custom RTOS painful.</di=
v><div><br></div><div>----</div><div>Yang<br></div><div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/255261de-a630-4790-b91c-16c569248829%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/255261de-a630-4790-b91c-16c569248829%40googlegroups.com<=
/a>.<br />

------=_Part_204_66566121.1572587941226--

------=_Part_203_570993345.1572587941226--
