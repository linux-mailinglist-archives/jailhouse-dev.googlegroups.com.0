Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBRXG4GYAMGQECD6GLWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1578A2252
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:33:28 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-dcd94cc48a1sf599169276.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712878407; x=1713483207; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLY3/gQ1Xx0+avPwxKwDZOpIGzMet1zealhcGMlMQ5U=;
        b=XJ3hWUV09MMlQfbfEb/s98E7zj8ZzxR+R+7m1xduDfNb6sXApZDaqIbJhCXf38i2X1
         iQ4fEE55za38UPXrMGrkzIO6zWhQLfvqzgItvg7uXI7MbS+DwSTIqW9bGOhNqeKcj/bH
         VDegQMdBm+T6cSGNLss1CgE5lXBG2LbxqvES95jAbo2zmEB/+CkZ1FpbZ/qutf5WfjZ+
         sCAs6KiBzwI8wx6pTnNrVJspcgq0eMpZSoHdw8vkkfetyTnrgH3nu1RfkD+GshzikXEm
         12dd9W+ddPKM5tXO4kgx91Z0jYseRbS1i2yK9PXYMXk210q3T6mC6VTgUSEDosCzb9wu
         JUuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712878407; x=1713483207; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLY3/gQ1Xx0+avPwxKwDZOpIGzMet1zealhcGMlMQ5U=;
        b=KJDDbZbyklWW9gjjFiZyn3BG4XUiqo2papZRITtaVDCTM0MokJV9v9B7LOdwQOIcEq
         +p4Ugqc+UXbG1E7m6dCxq/nvTz/qpGPLM/OFPyM2tyxEjT50kPuUTPQ4YPgzRS024U6q
         D7bx17ez8Z8gel1YlJwxBDAMWcML9va3bREAgRwY6Xr3bqslCPJcC14kPR68t1IEUUmR
         5pP09O5e2cd8hHrFh4j7k8tP1Kx4ldf3+Z9ORfo1xnRTYFPOwfFxMWUFifOWDI6q5Sr/
         plIkiTqSj+NeMWo9LjpQWKpK3nBtAoWJsbCl5Z+iEU/RvWP1N8BasVahuINSJ0ytg+d/
         eEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712878407; x=1713483207;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLY3/gQ1Xx0+avPwxKwDZOpIGzMet1zealhcGMlMQ5U=;
        b=swXUmnHyIJrtUBhariKPegbTGBbBg8UYyl1L8833NSvbo+bLcWzXAIr+1l7U6sgKWv
         eh9BheNv1k7tD8RJahuI8xf8zd1eJHx+QIMV7SFQPNQA4LB97YU+4zsIKkoIFdf52zvV
         T3ToeTTChojZ0xf6bxAMp8A8If9DZwkB6Pu/3qgUEAk42q64Z+V0WsiRv+gYfuE0TwWu
         5pwB3WvNRFg8psNevoK12416GOYzHAy/ju7DFEBaZ87jQDrpFJGqGkYq3cYIMe5TSjsF
         9PMfxqtYISO9oDMji6DqckzDy+bFgwMJTiHkIAg/RXyotybekezMb8HgxJ9jcbIxzB9w
         +pfw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCV1VH40740/sO/ZQbzVyEyT/JMHRQummUBVFiw0sz4wBd5ukZeLgbZv1fXwn2tbA8BpKXL4czH1v0cEfZ2JyQ0Mt2OTKwm2gPOm3Ak=
X-Gm-Message-State: AOJu0YxvrwRW3cOEHly/i3ea4pUfHnimjTmC/dE4wYz+8A3+qQOmWdA9
	CTyv6LCiebw57CdlqO7AsjdGCHyPdOYaGXc48hnzl9+kJdlDyABR
X-Google-Smtp-Source: AGHT+IErOB/DOP0sfgbOrJVQL+kCHas/2xq90Ywt9Os1mz65v/I/VrIuYtY8vQ6DW2jnHJrV6McbMA==
X-Received: by 2002:a25:80c6:0:b0:dcb:aa26:50fe with SMTP id c6-20020a2580c6000000b00dcbaa2650femr1129437ybm.15.1712878407425;
        Thu, 11 Apr 2024 16:33:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:dfc2:0:b0:dcd:202d:6be7 with SMTP id w185-20020a25dfc2000000b00dcd202d6be7ls721306ybg.0.-pod-prod-05-us;
 Thu, 11 Apr 2024 16:33:26 -0700 (PDT)
X-Received: by 2002:a25:ae26:0:b0:dcd:ad52:6932 with SMTP id a38-20020a25ae26000000b00dcdad526932mr258260ybj.5.1712878405921;
        Thu, 11 Apr 2024 16:33:25 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:33:25 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9302c2ff-1d84-4271-b93a-189add4b0b36n@googlegroups.com>
In-Reply-To: <CAEfxd--FGSJMkPhD1fds11Gh_DBMQGZiabAyVQ1QYEqcs112mg@mail.gmail.com>
References: <596f9ab5-8817-4ddb-8c0b-8d1dfbfd8007n@googlegroups.com>
 <CAEfxd--FGSJMkPhD1fds11Gh_DBMQGZiabAyVQ1QYEqcs112mg@mail.gmail.com>
Subject: Re: gic-v3 inject pending interrupt.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_15628_794443165.1712878405293"
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

------=_Part_15628_794443165.1712878405293
Content-Type: multipart/alternative; 
	boundary="----=_Part_15629_67859874.1712878405293"

------=_Part_15629_67859874.1712878405293
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9302c2ff-1d84-4271-b93a-189add4b0b36n%40googlegroups.com.

------=_Part_15629_67859874.1712878405293
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
om/d/msgid/jailhouse-dev/9302c2ff-1d84-4271-b93a-189add4b0b36n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9302c2ff-1d84-4271-b93a-189add4b0b36n%40googlegroups.co=
m</a>.<br />

------=_Part_15629_67859874.1712878405293--

------=_Part_15628_794443165.1712878405293--
