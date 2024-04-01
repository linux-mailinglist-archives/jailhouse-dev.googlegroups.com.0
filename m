Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB6W4VKYAMGQEZOCMBWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb39.google.com (mail-yb1-xb39.google.com [IPv6:2607:f8b0:4864:20::b39])
	by mail.lfdr.de (Postfix) with ESMTPS id C11F9893B25
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:54:20 +0200 (CEST)
Received: by mail-yb1-xb39.google.com with SMTP id 3f1490d57ef6-dcc05887ee9sf4540129276.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711976059; x=1712580859; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/qbOSbkJDoPalJMJcjiEj+eBAcYHvBJVUcs4Z1MpQ6w=;
        b=rq8DDFbBLfDZKvN2NWZqiMDkwsYcAhC/rY3cfBhgsesbBbH6S+lmvQ8ay082q6Q6bM
         EiG+oQ+yqKx4xEhUkq+oRxtLmD5TJadGQHuHYmv5yjkSJj11Lnu8xR+MNxi4FujvbnkS
         30cLNWdhxYfD306H25snDClMtxQDt3LiBBesECoAbbzqw6FV/5DTMwySlEjwKCJ6NVud
         f/WUKlo9A6pQnTVXSl9oVWLYMTXvXot/YSo8pyHdSV9NwC4vYYVLJFRn5Zq5HM7AYaK8
         5axFxFRv+rD+W8muY1oyfbIfsg1/3fKSNRkiZCqINVTHq+T+wlyiXUt4hEo5kKyiMjoJ
         95nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711976059; x=1712580859; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qbOSbkJDoPalJMJcjiEj+eBAcYHvBJVUcs4Z1MpQ6w=;
        b=DLZUMyfzDipm7Tmf69Huvvojc+W3hIYtnUCth77ke7mO6633J586tBp7XCgNw8uH3U
         qZiOHbWjMFq+LEU5igSTjBJvqMpvG3Ysu3z/rvllJsPSLuTIKX6enncgpvV+9zePNKdH
         F2QZPQRwpmhn6AIv3+qXUyYMQUOBAtcmdw/B2+fn0hZCyWHRejeZHmcRlvoVSfaCK2qs
         7xzQQUGj8PSEpllmuDpRQYPOpDEJqfzS7c2G1yrHw3PljxWzWYKOALoMUoUaJm3m2KlZ
         tfbRV+7E4Dt+jKMDMIaRj+hSAGVG0HGhrbzYu3e1ubF9Vma+yjYc43+qip5JY/1za+Or
         Hubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711976059; x=1712580859;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/qbOSbkJDoPalJMJcjiEj+eBAcYHvBJVUcs4Z1MpQ6w=;
        b=DuU4w/P5ybXdUmYAjVxc7MLgGoEdPvvRJ5n9meQPcKNf0ctUZfEnE3xEdUkUav85QN
         nha/l3Ji1RL+w8nz42Fvdwa7XcWtZVJIPjggrHXZoyaWN4iyC9xvOZS8oCAHS6tyR4Rg
         0KLPlS7r7aZPhT8iQAc2QUStOca3yJEbR7PYqXPcm7B84364f22EEISlVK1jdBp9yGLc
         JZzSatuH6imxd0/2ArXGuZ4fvyE57fB15FExkAVKVzI6BYbqWHsVEJ9vX4w40Y9unfs4
         IVPg5e7snuqhGWxQDqrBH8GIZq7lmzWqxPnFeM2v+MydWrUMQ2ekMfA1EUUWsFseRmcr
         hsEA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWyC+8Oehg9fVEKUgh6/iMrjwpdbT0Pm6c36Nnn14q4BeXmBLFfuwsbsAIcL4i+F+itTm+Hkjer3mTBEw8zEC5NMKBpm3QDPtYSJhA=
X-Gm-Message-State: AOJu0Yx+T7zhq/Ugcp3J/RSxqxqAEwXyoonH9LNuwMUcWCOciEtpxAwM
	Fja0AGXHm7JAB6/PUs2kj8E+XHzwJNSJYFZFxFST/Qjy9LtWYB76
X-Google-Smtp-Source: AGHT+IHKj0rzgkNFbSWkLKQl1j8Wz+/Gq/La7KYqFHus+6+UCL1OATGBXn72b2pwLDl7I1TQJoWB0A==
X-Received: by 2002:a25:6b45:0:b0:dda:d41d:332e with SMTP id o5-20020a256b45000000b00ddad41d332emr7292859ybm.44.1711976059568;
        Mon, 01 Apr 2024 05:54:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:aa29:0:b0:dcc:4059:deae with SMTP id s38-20020a25aa29000000b00dcc4059deaels889948ybi.2.-pod-prod-01-us;
 Mon, 01 Apr 2024 05:54:18 -0700 (PDT)
X-Received: by 2002:a81:6cca:0:b0:614:74f6:df16 with SMTP id h193-20020a816cca000000b0061474f6df16mr1608181ywc.0.1711976057831;
        Mon, 01 Apr 2024 05:54:17 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:54:17 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4a6860fc-62cc-44da-b407-8e7792f2891en@googlegroups.com>
In-Reply-To: <6abe410f-8ceb-4af0-b393-10efc03edda3@oth-regensburg.de>
References: <5a564454-0a20-4c44-93c2-67e30025c8a6n@googlegroups.com>
 <4b8c293a-de5d-4ede-ab38-c42294ba3554@marples.net>
 <36d21a58-fb8b-47f3-977f-ab179f0ea8b6@oth-regensburg.de>
 <2305fab7-744f-4cef-90fc-08879ff55ae4n@googlegroups.com>
 <c33ce025-503c-4a9e-b17d-c792587adbb8n@googlegroups.com>
 <6abe410f-8ceb-4af0-b393-10efc03edda3@oth-regensburg.de>
Subject: Re: Can't install jailhouse on linux-6.1 arm system
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_224980_101109293.1711976057116"
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

------=_Part_224980_101109293.1711976057116
Content-Type: multipart/alternative; 
	boundary="----=_Part_224981_1133720993.1711976057116"

------=_Part_224981_1133720993.1711976057116
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4a6860fc-62cc-44da-b407-8e7792f2891en%40googlegroups.com.

------=_Part_224981_1133720993.1711976057116
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
om/d/msgid/jailhouse-dev/4a6860fc-62cc-44da-b407-8e7792f2891en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4a6860fc-62cc-44da-b407-8e7792f2891en%40googlegroups.co=
m</a>.<br />

------=_Part_224981_1133720993.1711976057116--

------=_Part_224980_101109293.1711976057116--
