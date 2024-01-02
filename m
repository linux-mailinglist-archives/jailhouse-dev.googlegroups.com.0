Return-Path: <jailhouse-dev+bncBCYLX56ZREFRBVXH2CWAMGQEVEUPTQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113a.google.com (mail-yw1-x113a.google.com [IPv6:2607:f8b0:4864:20::113a])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BDE821F28
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jan 2024 17:03:36 +0100 (CET)
Received: by mail-yw1-x113a.google.com with SMTP id 00721157ae682-5e73e6a17d5sf172397947b3.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jan 2024 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1704211415; x=1704816215; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3hLD1maj3X32hV6NTxaMJazc2NTL2npxnF0uFjfDRk=;
        b=TdwjG/i7+FnBFi4lpDDuL+9aDnoSvn+X9OiJupyJYV4+h0laSiSjtAukJr1LOVDOiX
         taclBGa7xufMttw+PbJ+RXZxh76H1DaMyrXUA4Y1dv7rL6SlIWZyfBvnUIr5HVcHgaoK
         kfoRznRaMiCQnlgvfKQqblcN8nGwmhxdFuciPnwO1m1VlZR7wLOV7J6ZMiEQDa9x/HGH
         QLIN0Xlo4sei/cc24iWpBS05NaoR9qCdGAEeg7eEqC3KGb6wMafpBefyor6u/oi1qCEp
         FDRokqi8JDDtpiJokXOci5C3+74cqm6noawEmpH8kd+dh+XJKxSOL45pQUzG/8nNjmpE
         Lisw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704211415; x=1704816215; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3hLD1maj3X32hV6NTxaMJazc2NTL2npxnF0uFjfDRk=;
        b=VqgexC+oRxszApAddvIW/RTsOU8hhEJSoh5ukmSODHxqkKtspla8Y8FWpDkd6TnpDq
         SriJfSqpTvn4iIcnIbcQ7sw1hPbXnMycKjYiFepbhi+nUqiV4lli4qXJ06nnrmrUOeW9
         /Md4iDe1GMrAHk+1hQqgBH0z/NO/SWpnhJBuC+TXSjUGtpFZdWNmgq5mhnXYXGGK6905
         1sexdu39cSkEvFLpJSXuS5C1jyDkHJRanuEwNQAk+IQM8lLCI+bBbR/fB9v/VfRO/uYP
         UsRhCasQqJp95/5EiCJAWSaQaLgmm4QXr3B9d1sFN/Yk5Nfe6Pvd2sbJ/8tUfKUu+maF
         WJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211415; x=1704816215;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3hLD1maj3X32hV6NTxaMJazc2NTL2npxnF0uFjfDRk=;
        b=hFDF5FZXSDNnJT4b+b2mqd7rKMEReCyC21TkGEyqu7BGag7SJ/9D/FApqJexH9Koj9
         oWcjyi4Y978xmbXmNxE9yNj0E8HLP/FdeJrhmatpV+6cIj+FAn5KjtpRPzGzKmknLDMt
         gYe2WBNXLxjvdRmvGc1UrDGVVeDMvHwXYoa33fk7h3JaaBnxXgxv8mkHLHJTXVOtJ+Bx
         z09pmZil6qhcxovtxd+TccNJ02TKc2WzigZ5McH81+47FOYRFmJVYWDWOeZC4VsNI8iA
         2wI1OirAN4iN656ZtsB20PWAAzlmReR6m6JZC2sJ7tJ5z0m+TIAGYBNr4lVvmAWa8ojl
         L4uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxbjQR8lKgMVOZHrXgGQwz3Qi3tqpMiKV12xD4jg6EPTSTLgmB2
	7ojb+Y1OxAeeMdIgo8rZ4KM=
X-Google-Smtp-Source: AGHT+IFN7Jcj2QrIQs8e047mLPRBcAwcoGNC8nMRAcQzR7nac7+HRnE1qqUWax7zr3DbWNDpmm6F/w==
X-Received: by 2002:a25:6914:0:b0:dbd:c9dc:8751 with SMTP id e20-20020a256914000000b00dbdc9dc8751mr8965329ybc.102.1704211415127;
        Tue, 02 Jan 2024 08:03:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:41d2:0:b0:dbd:c324:2d9a with SMTP id o201-20020a2541d2000000b00dbdc3242d9als2346416yba.2.-pod-prod-05-us;
 Tue, 02 Jan 2024 08:03:34 -0800 (PST)
X-Received: by 2002:a05:690c:3382:b0:5a8:33ab:d545 with SMTP id fl2-20020a05690c338200b005a833abd545mr9188185ywb.2.1704211413946;
        Tue, 02 Jan 2024 08:03:33 -0800 (PST)
Date: Tue, 2 Jan 2024 08:03:33 -0800 (PST)
From: Benoit <b69644445@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e06c1b28-3007-421a-960b-a298cfaba7ebn@googlegroups.com>
Subject: Fail to create sample cell on Intel N6005
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_114199_1939195628.1704211413137"
X-Original-Sender: b69644445@gmail.com
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

------=_Part_114199_1939195628.1704211413137
Content-Type: multipart/alternative; 
	boundary="----=_Part_114200_1010654014.1704211413137"

------=_Part_114200_1010654014.1704211413137
Content-Type: text/plain; charset="UTF-8"

Hello,
I have an Odroid H3+ (Intel N6005 - 4 cores) with 8GB RAM.
I successfully recompiled the kernel (5.10) with jailhouse support and 
installed jailhouse

Loading the kernel module works fine but the following steps make my system 
unstable and I am unable to create a sample cell (I tried tiny-demo and 
acpi-demo)

From what I got:
* I have the memory reserved upon kernel startup according to settings 
generated by jailhouse config create.
* enabling jailhouse works "pretty" reliably. 
* starting a non root cell cause kernel crashes : a core is not responding. 
(as reported by dmesg)
Afterwards, my system ends up hanging.

I didn't touch anything else and I don't have (yet)  access to the serial 
console (going to look for a 3.3V Serial to USB adapter).

Did I miss something ?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e06c1b28-3007-421a-960b-a298cfaba7ebn%40googlegroups.com.

------=_Part_114200_1010654014.1704211413137
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div><div>I have an Odroid H3+ (Intel N6005 - 4 cores) with 8GB=
 RAM.</div><div>I successfully recompiled the kernel (5.10) with jailhouse =
support and installed jailhouse</div><div><br /></div><div>Loading the kern=
el module works fine but the following steps make my system unstable and I =
am unable to create a sample cell (I tried tiny-demo and acpi-demo)</div><d=
iv><br /></div><div>From what I got:</div><div>* I have the memory reserved=
 upon kernel startup according to settings generated by jailhouse config cr=
eate.</div><div>* enabling jailhouse works "pretty" reliably. <br /></div><=
div>* starting a non root cell cause kernel crashes : a core is not respond=
ing. (as reported by dmesg)<br /></div><div>Afterwards, my system ends up h=
anging.</div><div><br /></div><div>I didn't touch anything else and I don't=
 have (yet)=C2=A0 access to the serial console (going to look for a 3.3V Se=
rial to USB adapter).</div><div><br /></div><div>Did I miss something ?<br =
/></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e06c1b28-3007-421a-960b-a298cfaba7ebn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e06c1b28-3007-421a-960b-a298cfaba7ebn%40googlegroups.co=
m</a>.<br />

------=_Part_114200_1010654014.1704211413137--

------=_Part_114199_1939195628.1704211413137--
