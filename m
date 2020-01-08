Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBQXV23YAKGQEXWSVBOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id C2817134030
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:19:31 +0100 (CET)
Received: by mail-qt1-x840.google.com with SMTP id m30sf1819289qtb.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:19:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482371; cv=pass;
        d=google.com; s=arc-20160816;
        b=L6wD2TWQew8vB+J5EB1BJrXEdOjKCyMttmxEFyoPpdo2a3OvgR1H0GGMY1Ot1Lde/M
         wObHuet2QPn/e5EESeQ709dz/6mnwwSUDEMf/kRX8V75p0+Dv40cGGinBVRGOcjxhrfr
         t+8XHi1LGc2UDOAcI5Vl0BKvzI3dk6mfV1evDTjgWttdHqk6SeFnnpThoXsQhFn+Xzhl
         +Rnn3tdEbbBsfIiZh/4/eW9EXyX89qj5Hf6ijOYF0qDqm3izxsoufde5iJ/6CVT00ckX
         gBlV1kliZ67In5f1FW7E804CCj5SyPynCK7evzx6XVA69ag1/lsMWOd1dbblqZVCSX9R
         +DSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=24A0UzDsXCOeizOR4w2Zwcp7EnZYpwehwk+t+xCFCiU=;
        b=fMuv7QJLz49Gy2OHX2/m9FjoBrovDRAfShmm1su++mzPi5wTR9N/pqOPmaAi3lAlRU
         YrsUMaR7h7ucK99HZkkz+FNyx9WsidLdag5JIs+WdtWJWlxxCLFHt/7pfLQAuKGrWHAP
         hxlN9uT7BJnvWoY3b8uk3tVRNO2ZTA7M3SYhl8MfIZD+rxxvbWDLDdmbiy/RM/1A7j4q
         C/WxuAnCnfiMY2kfCvH0Vhhe5bxB+WQW8Gt9muHd+qoypxr51yJHQTshpPloi57MNXBS
         UhsBR0DeOSouu3eurjQm1pTBvNs8lz+tCUv9khy2O/VdGTbVWSOUsII/tSkcNvMrgIvX
         ZweQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oDl5OkBx;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=24A0UzDsXCOeizOR4w2Zwcp7EnZYpwehwk+t+xCFCiU=;
        b=eqhroQFd9vwv7tyQswcm3SwKt89CjREjcz4f1gMqjsZ6HaUnbPwpmPPdk8UuWtqR+E
         XvAgFqJm/TDIYQyBODrMCbaH87I7pg3XZyE2XrBxRTsXEQikpEf0M1wVrtAWydt1Qaot
         t2CB7KSI6X8W1atuyES+wwYflY+LBz7qKB+qvuqfk1Fi+N2JnqAE4uZrIJloQsL7s7dS
         e/9/3km9dXJtiHqAQlmH6L40RiiVAC9MZiglwJEQo5wbf0wGE4K0C0jfjwkwsnFbbljx
         AAJgTg8LQSQXXhljt9Glzd9unAa6S4SPErEiPMLmVNcGkiPuGufCX0M4xa2psFjHF47F
         45QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=24A0UzDsXCOeizOR4w2Zwcp7EnZYpwehwk+t+xCFCiU=;
        b=pQs7ZfWSuVKHhaGTN/t4PmbGRpyknUjKkInkTouyTRUVy37sNv4OT0nr0tsvBroy4G
         Ew4w3akdrbYTFkjWPGv3E/KKjYkPA6+V/xd+eBpSNgx8u3R8E67PPN9w102LxFGFK5u7
         n/6964/mD7VvezKCHq7/gY5EZTF851QJAXow2KGhVdKqvisjZFjWyyfSrRIJmB6u/ett
         0GPjDGcIy6tdcwe0VVNbbo+fHrISZxeFRUAVORVEVlCMbjqMFtfPe8J8x1pWLClcu66Y
         LOJbcxlkKZsa0o04afkWWwLqAjuYrXSVZb0M0qyZXcDfXjKa9dJ+ujzuZ82RGKeVmrbU
         o8OA==
X-Gm-Message-State: APjAAAU2KPRcGnpW1mcBzFsv28QXY5O1WyZiY3kI4RC1Fxv3yQyMUQpc
	j80CVME8PlKaxQ773fHzBbE=
X-Google-Smtp-Source: APXvYqyLlUykIPzmmQ1jGqqGKywOTJVdZyRiU/4cqIGdBiS++NlG0kPsynCZxJB20l3VdhDND1eddg==
X-Received: by 2002:ae9:c317:: with SMTP id n23mr3841162qkg.356.1578482370724;
        Wed, 08 Jan 2020 03:19:30 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:e017:: with SMTP id m23ls1069850qkk.16.gmail; Wed, 08
 Jan 2020 03:19:30 -0800 (PST)
X-Received: by 2002:a37:4b93:: with SMTP id y141mr3868258qka.205.1578482370142;
        Wed, 08 Jan 2020 03:19:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482370; cv=none;
        d=google.com; s=arc-20160816;
        b=YikTTrL29w3+YSl7vB/NWZjO76A9Fy9eOcBPNySMWBSwccXJWMgYoDTasTk4hCM/nC
         yrb7NrjHLc2Jx0kRenbpaalGDzptbVD65OFanclUa1xT6QT0dKsONLrAr8Xx2jZ9W+6z
         jFgwOuNIHfdrEjsO0Y7UwY3heKCMZDCSBFhR8UwlnSNTkVjDRXtsh/MxCanGpJUGqoZK
         SoCNgEu5y8n9EbN/UzpjvTJAK+oIvt7okKWRpa0wyGMXshbG76jUEmIHpdKJbiVnNTu5
         95bWjnyeumZ/ye0ntAGCA/nsbuhg+KgdafqoZg9OyWgVHQO4nVvxurdvmlwb9B0oxZbe
         uNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IlDjuumCRYtIGYVtMX+KUfe1UUge4UfvVqUfyFZLFf4=;
        b=GemWy2aWdDdc54tvRc/FZxAWJg+Vb8JMhHreqCOnymYySpOzW7cIbjxF0vfIgQaRef
         9ClRcUejU/ZpelU4WGu1eFgsISWyBfXlowWyjB1XBn9BXGnaPBHGzZbEVQsasPXyAYLJ
         asIWZKjAIrBFPqYegJDlhukMyODffv7/LRTeys6vi4HaMaD0k+71TE9i3iYUwA1exgVg
         eWwdKesJLuRQ7EamOpXcZbhN93/lf2H8vegxdxCgmMGpuHohZonbpy69UbGFqJRBhEDE
         BoogHGgvgr/XjIWW5pV3bbKD10aT/Hx0zvMZ5i6Jnz/6pvGJxQLA0zu5CElcXDzzKLMF
         i/MA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oDl5OkBx;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id f8si125920qkl.0.2020.01.08.03.19.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:19:30 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BJTFu061189;
	Wed, 8 Jan 2020 05:19:29 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BJTit032072;
	Wed, 8 Jan 2020 05:19:29 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:19:29 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:19:29 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BJPDr021746;
	Wed, 8 Jan 2020 05:19:28 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 1/5] core: Update cell_state while destroying the cell
Date: Wed, 8 Jan 2020 16:48:21 +0530
Message-ID: <20200108111825.14280-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108111825.14280-1-nikhil.nd@ti.com>
References: <20200108111825.14280-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=oDl5OkBx;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Update the cell_state to SHUT_DOWN as part of the cell_destroy
This will make sure that the memory_unmap calls and unit's
cell_exit calls can see the correct status of the cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 hypervisor/control.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index b6d748d4..f4e06165 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -363,6 +363,8 @@ static void cell_destroy_internal(struct cell *cell)
 	unsigned int cpu, n;
 	struct unit *unit;
 
+	cell->comm_page.comm_region.cell_state = JAILHOUSE_CELL_SHUT_DOWN;
+
 	for_each_cpu(cpu, cell->cpu_set) {
 		arch_park_cpu(cpu);
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111825.14280-2-nikhil.nd%40ti.com.
