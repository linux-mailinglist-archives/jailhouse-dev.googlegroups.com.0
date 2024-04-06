Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBQVLY6YAMGQE6TWO26Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 730F489AD9A
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:07:48 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dc743cc50a6sf4603946276.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712444867; x=1713049667; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXnHCIzZgtrmO4M/6kqXHDeWNE+790dAgKwfPzQFxKg=;
        b=TIhofIaBLcCXX7ptChg1GtbkD1o5BVrZwj9C1cQWAgk6gZbe5HVX3B1BtX67zlkIRy
         RmhN9X80XwMaVH+3acx5vng3mPRPxvWq4DLA626cNcBTlsO02kAUiKsgIJWoFuW1/gTU
         buUSkItuVEV32z73CNrfkdxb/1357hWd5ZG+iBHVKvk3NfPo9jKfY8jobVZG7tvUHinF
         01lLpKxOCKaYNQksOj3aNlQCh02qmrSZtNlupA0H6mgagR8akgwrON+agoADsPNzv4o6
         wns8KHrloNu/NioTOklFrOywdIteDsqo7N3jLwgln0HCPP3J+/3iM/M1ZDRwsy+AbMsV
         3FjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712444867; x=1713049667; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXnHCIzZgtrmO4M/6kqXHDeWNE+790dAgKwfPzQFxKg=;
        b=ejXKoRI38ObwYwWWlZtnk2sKNTqUGL3Qn0GLPAiTJ1WAXYVFfCYsxEcuHrmXNtpHwU
         yAKySstjtwb3rqE29XtaKITcapN/Qv8LFdXEpzRL5RBD1vzjcTIhzi0WIz3DaJslkXxn
         Us8H9QBlLeOF/G1pmRzci3pn4VsLIN1oYJF5XmHB2MJFHtoBsQCQtGGDv3NanQ5BuiJj
         SiC8aFoYKQVh1uE1Q7UltwQof+l42NNXTb6IAgGoX0PVw6kme4YjTCE2iivgcF94As7k
         wYL+p2gr90rdMr8LnEuiGY+L1bz65tw/hqxQ0oH7V+ahLecw/otFy4+SaOFkIHA+bhvU
         FHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712444867; x=1713049667;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXnHCIzZgtrmO4M/6kqXHDeWNE+790dAgKwfPzQFxKg=;
        b=OuRUQrc6hU1dOaegv4zTbxlf6LM82304gT9hDW/GeDGyho3z5Sz8YRUf/t7rE/HhD0
         spOOBKThR4nrhrirkPqkYWGkoQfA+PKOmIJrwkIhm7Xfw5BMmusVco8AB7UemK5oQpXk
         qYfJ0Lo6kdgX3Dx1bxWUsJlYFacbPgr9ppOCn1OEb9hoJi/sK1CSrCkO+J2Yo4QGBNeZ
         nYkm93um3QKkmhKFzbjUxCNm7Z3Hqo0ZxEJv6rdXbXc9WxnaQdsb3Iu0mDK1PUcxeRU/
         teFEqtqaM5eBG6bXlVCWG5F7J0P0q8072lK20VqcKvTmtTpxDSkb7p2EsF1PX5zZAgBs
         Px/Q==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWl1FUcHih1D+KbUk5/k3rtqpRYmsaxopYYp/VmmOCrhRo30NZOp7TMdIt743Ft91GH95P/k9Tw+J8k3D6bF37q6mSngt/3y+u2I14=
X-Gm-Message-State: AOJu0YzrB+frw+/QxYfQqv3Rd0UyZ4NRbc5W7eLckVIrpXNvX+uQF6BJ
	CpzaeQWAaHw/dpGOe8Af8vGd3cp1kePklBqxJIUdLzPmhAj9/6kD
X-Google-Smtp-Source: AGHT+IGaf7PXna3Z3hj+0ou8uNTlavKSLe4rVgN+ASNteghu0rq6oajiWri1m42+gFTyZFaKyod/0w==
X-Received: by 2002:a05:6902:2b04:b0:dc7:443d:d9da with SMTP id fi4-20020a0569022b0400b00dc7443dd9damr5396514ybb.4.1712444867301;
        Sat, 06 Apr 2024 16:07:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:af04:0:b0:dcc:37ed:efb1 with SMTP id a4-20020a25af04000000b00dcc37edefb1ls629313ybh.2.-pod-prod-00-us;
 Sat, 06 Apr 2024 16:07:45 -0700 (PDT)
X-Received: by 2002:a05:6902:2b8e:b0:dd9:2782:d1c6 with SMTP id fj14-20020a0569022b8e00b00dd92782d1c6mr1938230ybb.1.1712444865563;
        Sat, 06 Apr 2024 16:07:45 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:07:44 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9c951e2c-fc16-4d3c-bf9e-40ceb8186216n@googlegroups.com>
In-Reply-To: <1e3e8948-26c5-47b3-82e3-61be84a517c3n@googlegroups.com>
References: <1e3e8948-26c5-47b3-82e3-61be84a517c3n@googlegroups.com>
Subject: Re: Problem running Jailhouse using prebuilt qemu images
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_185724_1865400595.1712444864813"
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

------=_Part_185724_1865400595.1712444864813
Content-Type: multipart/alternative; 
	boundary="----=_Part_185725_1955455861.1712444864813"

------=_Part_185725_1955455861.1712444864813
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9c951e2c-fc16-4d3c-bf9e-40ceb8186216n%40googlegroups.com.

------=_Part_185725_1955455861.1712444864813
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
om/d/msgid/jailhouse-dev/9c951e2c-fc16-4d3c-bf9e-40ceb8186216n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9c951e2c-fc16-4d3c-bf9e-40ceb8186216n%40googlegroups.co=
m</a>.<br />

------=_Part_185725_1955455861.1712444864813--

------=_Part_185724_1865400595.1712444864813--
