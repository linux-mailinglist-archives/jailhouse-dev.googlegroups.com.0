Return-Path: <jailhouse-dev+bncBCWZR36CYUJBBU5I7SYAMGQEGZ4ATFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AC8A79B3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Apr 2024 02:14:13 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dc693399655sf9319874276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 16 Apr 2024 17:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1713312852; x=1713917652; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPpyV2HSZMuJB57bDIVPNz/E5GE+vgzAF4a/5NODi6k=;
        b=Y+JzNpHirn3gvK8bdt6iurZ7ESZGRdgIpwaWAtiey50gDgZ126pckp8kfbKoIA2n+L
         R+G8E765H3SPInrvegfXQY1HycoCzxvjZd4sqBnq5WGbXYHpu3TUlveoYFlibMhp7HKS
         RpW9XV6/vLyNpWqivzp6FDn9Q3fN1pFAtvSBUFuXQ6VghV20f6YvHsQo6qj6dUfVNLzV
         IuqxTB9XxhQaMh/eZqLIlmCP/rg+/PQauik3BIWbyLzwBrt1lR/AM69v1rPIGlB29+gN
         BKWCUUnyUxTYqJr2rXZ4pWb032Ddl8wSt/ZOAcSl0/HBMviBNQ5v7lQU4urpmc8gvGwi
         86nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713312852; x=1713917652; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPpyV2HSZMuJB57bDIVPNz/E5GE+vgzAF4a/5NODi6k=;
        b=G3RzU9N1ZA/V0An9EG6uf1QaVjdUXX8BQjcNXd1v1/Irg7P5rrGQa1SMCgbx/2/j6C
         n/Nm3t8KpIBPelD4hpWLJX0sH3t+hiT1NqLFs5XtS9kEFlIL/3ZBin/FwLFvrhbO03Ca
         VY4xrhIswswGFgsISsZweXswSI7EtZbQQSPKj7X+4N1Ya4O6DnYGD/1pYt4a4V3gFImi
         1eWtxSBpuCHkaTFnLQt2WnjbPW3fHrcdo858tfAVlvP+KeDaVoqQArd8/Oy3p835Mxi8
         FkRlPr1xAvghatH7/RtZqyS5Sm0DxsRId2z41iqfe7OkhCmvddCCvY/UxsvHp+fhVxey
         5I0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713312852; x=1713917652;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPpyV2HSZMuJB57bDIVPNz/E5GE+vgzAF4a/5NODi6k=;
        b=f9j+LpXbQdmjet3/vAJ610c3mtHpXhNSBic4LybziQOz54YaTLvQzWJIFVa31MdrRk
         2N2KA8kHkxSO/zvrDJPxgg24RQXUHzU42gfxmQkUvu/d9T9Y5z7COJBGqf1GsVkTvWwF
         eg47daz4e5Set9QPNNfosMegPPqUdZ7pax+CTRYJqhVxki+N0w1mmUvCmwdC7sxzznNS
         IQI+fL4eJimXsFTFcN0BYDw5sx/c5yA0ndgmRE2NhfGkUbNUZsXFO5yVQ3p2OiaVwFpm
         6guzG6tIUEI8PIkHJD+5mP56aUHIRN045d+ADK+4JjWNWg2WJzBkBu7EJ0+Ow3vogkxN
         X9AQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXuf9D8PN47DYMsHpTffBER+WJxMcXF4YhbwguJo60m92pSUgi+rPyby1ATHYJpGTzMl030oFcLasPbp9kG7y3fd+1eqtG+LB2v61k=
X-Gm-Message-State: AOJu0Yx9EMedugTA4OCy5HtpTaSUcH1mym6uzhTfT1I/py3DCYXeUwa5
	QT3MOXf6vVQwo8PX0fUWfrVbh5F5+MS9jYc+J8c4ZzDZoiR7mY5j
X-Google-Smtp-Source: AGHT+IF/ZmbWg91aWhqYC9RHjhublBFRxY+ykt5w8e8U9Fw7sGu9YzXMaFt+5Zy6li3liD1xjWb/dg==
X-Received: by 2002:a25:4a8a:0:b0:dc7:4806:4fb with SMTP id x132-20020a254a8a000000b00dc7480604fbmr13823124yba.8.1713312851891;
        Tue, 16 Apr 2024 17:14:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:74c3:0:b0:dcc:717f:41b7 with SMTP id p186-20020a2574c3000000b00dcc717f41b7ls853511ybc.0.-pod-prod-07-us;
 Tue, 16 Apr 2024 17:14:10 -0700 (PDT)
X-Received: by 2002:a05:6902:348:b0:dc7:5c0d:f177 with SMTP id e8-20020a056902034800b00dc75c0df177mr3965530ybs.6.1713312850307;
        Tue, 16 Apr 2024 17:14:10 -0700 (PDT)
Date: Tue, 16 Apr 2024 17:14:09 -0700 (PDT)
From: Franknoel Njubuin <franknoelnjubuin@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <74ee75d7-1aea-49d4-8898-bd20ae5e74cen@googlegroups.com>
Subject: Greetings
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_86514_1379729493.1713312849422"
X-Original-Sender: franknoelnjubuin@gmail.com
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

------=_Part_86514_1379729493.1713312849422
Content-Type: multipart/alternative; 
	boundary="----=_Part_86515_810088278.1713312849422"

------=_Part_86515_810088278.1713312849422
Content-Type: text/plain; charset="UTF-8"

Family

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/74ee75d7-1aea-49d4-8898-bd20ae5e74cen%40googlegroups.com.

------=_Part_86515_810088278.1713312849422
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Family

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/74ee75d7-1aea-49d4-8898-bd20ae5e74cen%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/74ee75d7-1aea-49d4-8898-bd20ae5e74cen%40googlegroups.co=
m</a>.<br />

------=_Part_86515_810088278.1713312849422--

------=_Part_86514_1379729493.1713312849422--
