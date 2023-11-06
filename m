Return-Path: <jailhouse-dev+bncBDDLR4VP3AKRBQERUOVAMGQER7G5QHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3a.google.com (mail-oo1-xc3a.google.com [IPv6:2607:f8b0:4864:20::c3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F087E1F5D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Nov 2023 12:06:42 +0100 (CET)
Received: by mail-oo1-xc3a.google.com with SMTP id 006d021491bc7-583fb42332csf5094902eaf.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Nov 2023 03:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699268801; x=1699873601; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11tGUHLYRc4C9pT0YxRPLLqT6ITeh5FRKZySfCXOY8w=;
        b=RdKw0WlQOzMc7dDCPp8iz0JZA+chufQ79xUJYok5PagE+zNJefZ9KaA9qzYFJISzT+
         FsR8VKobjQYLhh0KQm1OnjEmqSFPfYlHYCcUK2os4Za5OsX3l0fxukZQu01oiz/uYtJL
         D7v1XqVXxEeXRGaEMAynIJ1PG4C9vuM4Svl92F8Hokr44h6GPb+rdrFBmwk6xlZQ8oNm
         LKuCIP+KppBxM6EJGyukOJ+5Xuqr0YvnpPtfmXNVn8pnYuUwqAfnOfX4uI62Cn99/gGd
         e6R1GFBdTsdP9AMbRoNiohK9f2JUgYTz2/QXqVi726ZAb/FTzplJXT4ZmVTtzuxg1hwe
         UX0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699268801; x=1699873601; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11tGUHLYRc4C9pT0YxRPLLqT6ITeh5FRKZySfCXOY8w=;
        b=ElXRMmsNr9cHMbrVatvtJm2s8z4k2emCgp9nHR0tPd+0pddwXzbYyJwFPYn4X+Z6Nx
         Rln6S7nSn87AL9Gtc+BBhHA8mXVL7WporqXVqh15BxiqunRDjAKJ6QsHoeJhXcSlB6xU
         giE00jLb0ERUFlIrfRGGiNgR+oKT0bOcZ2i+qsS9JTy3EhMiKfR/D+ITMHhDvLTaOnQk
         DZ0T46367+/B8NzedfTOd+yK5d+xIgGXaLUfia0pjOpKToRgZ5PcVFeJ0oXjlwmLbmQN
         B5vXZz1fULJNhj48bl1/hQk9V7Kxn9afX8LsYqcecmJ4bDemy+WDd/mo/blmhog5xzUk
         j1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268801; x=1699873601;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11tGUHLYRc4C9pT0YxRPLLqT6ITeh5FRKZySfCXOY8w=;
        b=gjyZK0YyPZzLCfcJUFlfYM3qHstR273i+r267JkVd/odVpqm+1PQy+/D82hxUuU/D1
         6SkDkyrBFhzOCEn5KXDZbYDczbE6uaHdpk/KcVRTtrBdrNFFd+YEFtuIhVq9ieqEgty5
         bUrgNzrnvc7Kqp9V0Wq44r6vi23vfBFOJqe3oqOhYD0qf1ijdCqtQDF/z0TBDPITQ2rT
         jGLyFwosdYduttO0GGmkcW30MdKqmNT1skqusUwhvMpyvtYO0Kvo+ryTFj6OtvBwNel0
         L2hsi9paj++Q9MYt61KIC2ZNgC6LyocnkGfV/qsafcpGH+N8PhtXcv0KFeP1vlLSW8CJ
         Y6Tg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyNCpN4NLdioT7Aqoq0oqIcybd+7UCialwXRrf12rK+z3rJdUxJ
	ztrV15eeoBBW8VEGSObZJfM=
X-Google-Smtp-Source: AGHT+IH/CeLPox21MWB4eNp8hRZ3YhFHrTGKFm5G8qjiUvXnw7zjuMzjaSE9m4nYeuDeFxDOmfo5Vw==
X-Received: by 2002:a4a:bb89:0:b0:581:d922:e7f3 with SMTP id h9-20020a4abb89000000b00581d922e7f3mr25121897oop.9.1699268801132;
        Mon, 06 Nov 2023 03:06:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:e7d6:0:b0:587:b2b4:2c7 with SMTP id y22-20020a4ae7d6000000b00587b2b402c7ls1355090oov.1.-pod-prod-08-us;
 Mon, 06 Nov 2023 03:06:40 -0800 (PST)
X-Received: by 2002:a05:6830:40b2:b0:6c4:c061:341c with SMTP id x50-20020a05683040b200b006c4c061341cmr8224815ott.5.1699268800140;
        Mon, 06 Nov 2023 03:06:40 -0800 (PST)
Date: Mon, 6 Nov 2023 03:06:39 -0800 (PST)
From: Tony <antonydellerario@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <187937f5-9346-485b-b2f1-8a7d78ac2768n@googlegroups.com>
Subject: How to display xil_printf or printf in jailhouse?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16548_1592842461.1699268799368"
X-Original-Sender: antonydellerario@gmail.com
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

------=_Part_16548_1592842461.1699268799368
Content-Type: multipart/alternative; 
	boundary="----=_Part_16549_1771443888.1699268799369"

------=_Part_16549_1771443888.1699268799369
Content-Type: text/plain; charset="UTF-8"

Hello everyone. 
I am trying to load a binary as a non-root cell of Jailhouse and run it on 
the Ultrascale ZCU104.  Within this binary there are serial prints executed 
via xil_printf that I do not see in output when I run the binary on 
jailhouse. I think because jailhouse does not support the libraries 
required by xil_printf, such as the printf libraries. In fact, the default 
demos (gic-demo and uart-demo) print via printk. How can I solve so that I 
can be able to see something output on the serial from my binary, without 
necessarily including the printk's within my binary? Thank you all in 
advance. 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/187937f5-9346-485b-b2f1-8a7d78ac2768n%40googlegroups.com.

------=_Part_16549_1771443888.1699268799369
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone. <br />I am trying to load a binary as a non-root cell of Ja=
ilhouse and run it on the Ultrascale ZCU104. =C2=A0Within this binary there=
 are serial prints executed via xil_printf that I do not see in output when=
 I run the binary on jailhouse. I think because jailhouse does not support =
the libraries required by xil_printf, such as the printf libraries. In fact=
, the default demos (gic-demo and uart-demo) print via printk. How can I so=
lve so that I can be able to see something output on the serial from my bin=
ary, without necessarily including the printk's within my binary? Thank you=
 all in advance.=C2=A0<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/187937f5-9346-485b-b2f1-8a7d78ac2768n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/187937f5-9346-485b-b2f1-8a7d78ac2768n%40googlegroups.co=
m</a>.<br />

------=_Part_16549_1771443888.1699268799369--

------=_Part_16548_1592842461.1699268799368--
