Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBCEOTTTAKGQEEVGNRMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF0E472
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 16:15:37 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id h196sf2869950oib.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aqhISSzvchguQJWMkSoZVquV/qn/yqBzOwr9MzkRQ8A=;
        b=cf4+UKRHjz0f/+ju0/c+D7+jo46X+FPkR3ZlCEf5YxRSceztcGqieYestAnzahKO3V
         gcruQNoz0oNzgLhdLqy70g/fgpR8Az65E24mqexvCGZJR9IXk1w9Vv71Vr/ZNUSRZ1X0
         mifwk2f1vQMwsOMQIQP+g1EZOmCxvDHS1lptIakD0XT5iYnEZB9TgS2kZ1H2QpFHAQVt
         NV7mxX4dovK0Ldcsg+oEF5M/bTVvIIbSNmBsd/4DlCXcxUCn+8zjMUimsIF3w9NMcKOj
         euhGD6MF9D09AaP/pzeMNPEd5I2hqD5XAwnmQ25yTMkgQCemlOLBhXNk40k2AvrnqN+T
         RQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aqhISSzvchguQJWMkSoZVquV/qn/yqBzOwr9MzkRQ8A=;
        b=lLsdFkCDll+QZBH9MJgQ89+taRY2zWkWIQ+UI0mhL3CUTYDyPOGreiodchkEzmSb0O
         Z7flUG4Y30fVIHgXHqzRfCulVcWkZ68RBchlx5JqyV+ZWkZZspOFTLRbLyDmQ9CIYlM/
         bx0AZrVDTdV9khp3cqWTj6Ryw5e/2Ph9bgMryaYTxiq10+vQ+jJnkqlV0/1hfRUr056r
         XMN/DHWDq1CZyg1or1p1bb6FfgX3VhlryevA3CDtHHjGw5Bv20RlQklAvx8mecyV2qS3
         vUMejnsIK+W87R3ZxDmBqoLtbAANTXern0/46bWta2u1lPatVO0VdTuFU+3rl5EfT9eb
         jWXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVB9iFUGhUi50TuEQOXkKL5lHzbkrMdsOKb8CJOekywRE/OgvZ/
	KaYqYT3Vp4QBssxYg15ex4c=
X-Google-Smtp-Source: APXvYqxlq1D/s5dbD9uZC0AajnH1hMOoU6aoyLifywUGy4uVYpcESUujtLpJ2xpwKqDHGe9Rdpse7A==
X-Received: by 2002:aca:7213:: with SMTP id p19mr9403019oic.20.1556547336340;
        Mon, 29 Apr 2019 07:15:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7310:: with SMTP id e16ls823431otk.12.gmail; Mon, 29 Apr
 2019 07:15:35 -0700 (PDT)
X-Received: by 2002:a9d:738e:: with SMTP id j14mr1543530otk.297.1556547335274;
        Mon, 29 Apr 2019 07:15:35 -0700 (PDT)
Date: Mon, 29 Apr 2019 07:15:34 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <93d661e0-8e51-42bd-b203-41270fb67e45@googlegroups.com>
In-Reply-To: <eea40cc7-543e-cd7b-beee-afc9affc477a@siemens.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
 <eea40cc7-543e-cd7b-beee-afc9affc477a@siemens.com>
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_391_1787460301.1556547334621"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_391_1787460301.1556547334621
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

While kernel command parameters are intel_iommu=3Don intremap=3Don at R710 =
and HP8300 machine, proc/iomem shows DMAR region under Reserved area. This =
patch or something else must be done for config creation to complete becaus=
e of generating DMAR region not found error although it exist.

I will send you an example between two restart differance at /proc/iomem. G=
enerally, I remember that kernel Ram Rom section must be.

Thanks.

HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_391_1787460301.1556547334621--
