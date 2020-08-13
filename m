Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBAEQ2X4QKGQEX37WNZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7171C243B2D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 16:02:42 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id 1sf3952449qkm.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TkJhea2UAQhNDaU0ZBqv3VvXXUaORBClkVvHAveLz6w=;
        b=abnEs4eH92OrgzlxfiGTl3IMIkwNVriGsr2L4of+xQhy9Rv6WUKDteV7AwtFqrvFrQ
         ObaPAjlp4fwiCeHUTw69havhJRBCBM8YBIlocuuPzEQiv94hCm4hXNaEoFpnsb9OpIGE
         ynrpQ/xzHuyOd2l7+RbZLbRbapIUZVs8XdRBAf0beMt4U3/bV8RcP7ZmNH+HoXn81cmN
         TVdc6Za2i1D/LaavN9p8Ng8UlegoKQKdTjImV3aXjGYFMSommAompAGqbjLgU3cTu/tv
         yQ+zcrpRuYIFgXA/VyCwaGboRQvFqcxCUts4JL9L428b3CynTyzGECg9Ey8hEm5PjCpG
         j+Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TkJhea2UAQhNDaU0ZBqv3VvXXUaORBClkVvHAveLz6w=;
        b=BzC2H8WD8w+/d5hikH4TcEigrUurIaY/Li3xq5mrpF8F4w9CQTYv6sRrIsEZ4jSxiL
         qP/cwupEDvfzxlDTJpQo6yey2wxVA6Gzx1sEe9ArHZuh+7/ZlMSmLu0cyBIUa/64Gsu5
         F5oLo9bzH+MBZ0t3qvQLcl5WatHM95NlpGGrprN8MsJbOIonChGGDnrvsHmISvO3+h3q
         vWfgbrhvsYnlKr4B9XMl6hyZE3TBkCByvEIL7gkfDtb9r/yQ6bspx20V2TIAKF6BXNjM
         jLyaMM9DQXF1ZAaTCvwsLG/zMCMeniQYltr6Mv3ubpUKqkQs0GXL80NxaaEcAtsi3wec
         XEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TkJhea2UAQhNDaU0ZBqv3VvXXUaORBClkVvHAveLz6w=;
        b=tCthqsHQMEvGF6Fy7GbMhbC5kIt85tPJlSVwVVgZtc17KR1jDp4K2yE+wyfLPgBXLm
         B/faEOzHKXCIYexwLM2vtW2FJyGcTgDeXakDJl8Q9zYsAW4zUzyEiXkMy3JjWnrMtGyL
         mV4LDn7tKCV19Jo4XoNB6Rmm8qDR1YiRovL6D79i3en7wJAYofWop438iOrdNaBp1g9H
         HnEuonEaXCKwI+o/BAH834nPf589QNi1G/Paugy3xuSnnXtZlUOr7MRwRe5DNtNM4T2Y
         9YgGPPv+IWkxLkSTSfGCCYgGIBFHPp3f6bU6XCO3HRK7NXdeTUW0fYhJ+lKFishkZ+yR
         FsuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Zi3pNhYzWH89NDRk+gQXMGRgX50buPGo1ArDnKf95XHITr3Mt
	cPyHZIsmAF9pIEYntYrywOU=
X-Google-Smtp-Source: ABdhPJyvFIT9kv6TtF91WQPea5TpkkFJN5ZVddhRPOTVeQMuFq/9jg+wqaFUFlEWLcGqxtX5DitvGg==
X-Received: by 2002:ac8:53c7:: with SMTP id c7mr5592337qtq.2.1597327361509;
        Thu, 13 Aug 2020 07:02:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:b087:: with SMTP id z129ls2632047qke.0.gmail; Thu, 13
 Aug 2020 07:02:40 -0700 (PDT)
X-Received: by 2002:a37:664f:: with SMTP id a76mr4596392qkc.344.1597327360465;
        Thu, 13 Aug 2020 07:02:40 -0700 (PDT)
Date: Thu, 13 Aug 2020 07:02:39 -0700 (PDT)
From: stranzjanmarc@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ce82e02e-1b8c-4979-9b3f-8ab0161e067co@googlegroups.com>
In-Reply-To: <ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o@googlegroups.com>
References: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
 <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
 <ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o@googlegroups.com>
Subject: Re: Starting jailhouse on real hardware without QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2164_131405030.1597327359688"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_2164_131405030.1597327359688
Content-Type: multipart/alternative; 
	boundary="----=_Part_2165_888765288.1597327359688"

------=_Part_2165_888765288.1597327359688
Content-Type: text/plain; charset="UTF-8"

I have now extended the kernel command line with "memmap = 0x5200000 $ 
0x3b000000".
(The hole kernel command line is 
"BOOT_IMAGE=/boot/vmlinuz-5.5.19-050519-generic 
root=UUID=0cf2de21-3396-451e-bdef-b1269f666db3 ro quiet splash 
memmap=0x5200000$0x3b000000 vt.handoff=1")
I found this hint in the generated system configuration file.

With the call of "sudo jailhouse enable 
$HOME/Projects/Jailhouse/jailhouse.git/configs/x86/sysconfig.cell", 
however, the whole Linux PC "freezes"!

What can i do best?


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ce82e02e-1b8c-4979-9b3f-8ab0161e067co%40googlegroups.com.

------=_Part_2165_888765288.1597327359688
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have now extended the kernel command line with &quo=
t;memmap =3D 0x5200000 $ 0x3b000000&quot;.</div><div>(The hole kernel comma=
nd line is &quot;BOOT_IMAGE=3D/boot/vmlinuz-5.5.19-050519-generic root=3DUU=
ID=3D0cf2de21-3396-451e-bdef-b1269f666db3 ro quiet splash memmap=3D0x520000=
0$0x3b000000 vt.handoff=3D1&quot;)<br></div><div>I found this hint in the g=
enerated system configuration file.<br></div><div><br></div><div>With the c=
all of &quot;sudo jailhouse enable $HOME/Projects/Jailhouse/jailhouse.git/c=
onfigs/x86/sysconfig.cell&quot;, however, the whole Linux PC &quot;freezes&=
quot;!</div><div><br></div><div>What can i do best?</div><div><br></div><di=
v><br><div dir=3D"ltr"><wbr><wbr></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ce82e02e-1b8c-4979-9b3f-8ab0161e067co%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ce82e02e-1b8c-4979-9b3f-8ab0161e067co%40googlegroups.co=
m</a>.<br />

------=_Part_2165_888765288.1597327359688--

------=_Part_2164_131405030.1597327359688--
