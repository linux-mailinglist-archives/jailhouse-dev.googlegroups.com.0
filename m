Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3NQ7XUQKGQEUDZFCEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2B79A0F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 22:34:54 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id z20sf38949277edr.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 13:34:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564432494; cv=pass;
        d=google.com; s=arc-20160816;
        b=w9kq5RRCX3VnzHP+rzLBx7beFMlGWyVFeBScvjB4rjTm+gZAxOe0oFgmug4MUEa+gs
         V3wsLZBKAiL8KT03+Y5mLXL67/azcwM+7fFWtwqPJUOgBgN3+5+8yoqQTo+RBp7oi9BK
         vWVd1kgL9asQjnip6tLcswvfCha6yr9EWzzw6uHihSMVixoXvsO3K1OXhhBNOmZpJFsz
         ikfEWKMCix5LJ9qhUDAl67deymMxvm/5AeYl5n7lRpdCxkEnYWL080vJPq/pzuAX7X4B
         yjx3Rh/WiSNfGPTXVVZQPtqDsJT/bc/SRpcqs8sBBNpWY6QCG9h+WSHh8UlHFHp4Czpq
         EOww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=qODw6E3mkDm9cDUvyTcTx43N+7V0ugmg1vts5laNdKU=;
        b=zTqtHHCgExV/UE/tcDydKyIZKpXbswWsi/EF5AmWEFDcT2jbftbkuyNs+nMYU4kEBy
         N7fV0pHnTtTc5gIVlLPwh2KTBxBTG916rwwpl/6mKEVM2TRsAn7D9EHa+c7zJU4dPbjG
         /C0wwJgfqEOm0V9conztgTrglPYIUO+FsCzFjHPdCuU7KaXkNA3VIYSqHHnPd2IIWyUe
         XqTp1PDM8XaAObQ16+udi0wbkJunOC8ghPy6gjYMvO/dC5OTALpfsKuOnpPjqYIHIshr
         v1trJF1jJ2oC3ZvJM1M4vbUilqGaWTlV8OQnXHI5LmC+s0KNWIeSxbKg8W1pTAZt0ih3
         wNzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qODw6E3mkDm9cDUvyTcTx43N+7V0ugmg1vts5laNdKU=;
        b=obXgodY5HN/5q9FKI7YLq2d+sdmXKfDMDK7YJjDAnLYHgaGfbXHhtXSqSgYU4UsYIR
         FaPmJxxZhaldD/BuS9G33vveElUdoQ4vvUy3izmmuPNpulOO6UQIP0pwmQ3usDfzrLUr
         qN6QZgJIKRYJ0tbDyrxX+pAA/47TxqqrhSbhL4GxBDbhMW+lXKSh0qBYuJ5Rh6keK0V7
         bxqwPhiNxarIk2tlZYdWiRKA065FXI6NR4pEsSyCR7x5F9K+mWp9pe+f/uB7mbVdtq6c
         anesgrxfoD/sNB9f7M1SLmQ3ozMfP8B7pdgCq4j0712TQXzpeIg/BO4F7oYF8P1fctuW
         1bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qODw6E3mkDm9cDUvyTcTx43N+7V0ugmg1vts5laNdKU=;
        b=N701vqM04GpAl2JJ+T11pD1jBV301/d0xH7jmQngH9+iKjAeshi6ONPHggXJ7FNyHO
         lhZEddGwm9EHo3LGz7tNnUszriALUj6mkVvLjPJun3iQ9+81dW4qLwGIxOXulnDYCZZm
         C8bnhcpcu2dTNbh04v6ysfa1bC2pTCFizCv8e+Z7oVqWCAXWTx+7m0EBzpCtscqnO/Fs
         u19Wd7D9SPsRC7w+JG79PY65C4ukW2x1acTNkEj/Vg1XPmlfZiBJ9Ki2DSzOdQnSfjKD
         ryIoYTY1p2CLPP6NCaJ/ACKSe6zex7wz8AiyX0cPcjGL/K3SUL4ytaibLF52MwGzZrVW
         3YnQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWllkGPyqp5DWnpZTGVWOTUZDdC+aryBYjfXh5/DgWke3vhUBXu
	/OgPy4+SjQIFBXWdhyx1Woc=
X-Google-Smtp-Source: APXvYqwtTNHFp8DJvR0OGx7ahapN86cSSLRxdacfoIdOT+jhbSEEBeACE3iVkjV/ctMGCATAPCMlbg==
X-Received: by 2002:a17:906:2ecc:: with SMTP id s12mr34580838eji.110.1564432493936;
        Mon, 29 Jul 2019 13:34:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7f15:: with SMTP id d21ls13180886ejr.1.gmail; Mon,
 29 Jul 2019 13:34:53 -0700 (PDT)
X-Received: by 2002:a17:906:604c:: with SMTP id p12mr86018955ejj.26.1564432493284;
        Mon, 29 Jul 2019 13:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564432493; cv=none;
        d=google.com; s=arc-20160816;
        b=xUVBn+DNmugA9UILF4h+a5h+DrwHRGFk11UgQEdAPCSiMljRt4OmSdmN7o2dXN018e
         KXre/E/NJCSVdnCnOylqCR+6+mnfhZ+Wsyi1R2qEpSgiB1Fob2+pBAMNZwJtXBIJvuTn
         bz82pDYflH5iOqdzzEM1npMEHKqNya9qK3IkwQZIg1IfpYD2o3bGu/TpDREp6creCclo
         R4QEyv0hMErYcyXx9lhA5a+U3yabsxwaLmv/jfmcO7SdwbJdIwe14dIdVSfk7FNTGlnh
         7LfoY2hGdLnxN72bJFvYg7vagqY6FN1WRZFdrhNrezlH2VqYeZzzbadNajLnKv8fFFnZ
         NAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to;
        bh=BHpcGPET543H5KcmRInGBBg171MYRBiBBnpeCIaTgBI=;
        b=DW1lvLPQbqVujDsWedAvtra7ckEhz1KbpAbH9xDmTVsvddsaFNZqZiNLbbwOWKqalS
         0qKTkKUlLiO35jm6ZVvuiMHc1529WwtK0061FR713ARwVK64ZfG/MPWG3JnHutBLfrwo
         9yuDGCvGq/T6H71dam5zh09DLaqQwDmS06Wv8g9iW3IluspMgxViAlxVE5uh0qLOhSpR
         uSJ9MPC1NJBC28TEIQ8sLL7woFJ8/YcmwEzOCEYTVaLkgJA12aCEx74K5BBlmiJAseVE
         7itkfDjCtjRt1KlcpF5VYS5Aany+LO9VFZe6VHtOZlXygNWWTwArSPliTmFTcoTCqkAn
         PbfA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s30si3421022eda.4.2019.07.29.13.34.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6TKYq4L030218
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Jul 2019 22:34:52 +0200
Received: from [167.87.3.181] ([167.87.3.181])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6TKYpq4020719;
	Mon, 29 Jul 2019 22:34:52 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Henning Schild <henning.schild@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] tools: gcov: Fix hypervisor image signature check
Message-ID: <07978f49-ba77-81a2-0eb8-4524f19d22ba@siemens.com>
Date: Mon, 29 Jul 2019 22:34:51 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

The header signature field is not zero-terminated. Use memcmp, just like
in the driver.

Fixes: 646233947717 ("tools: new tool to get gcov data out of dirty firmware")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Found by coverity, either only after its recent update, or I missed the
report when this was merged.

 tools/jailhouse-gcov-extract.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/jailhouse-gcov-extract.c b/tools/jailhouse-gcov-extract.c
index 3c25d63e..c126f976 100644
--- a/tools/jailhouse-gcov-extract.c
+++ b/tools/jailhouse-gcov-extract.c
@@ -186,7 +186,8 @@ int main(int argc, char **argv)
 	assert(count == hypervisor_size);
 
 	header = (struct jailhouse_header *)hypervisor;
-	if (strcmp(header->signature, JAILHOUSE_SIGNATURE)) {
+	if (memcmp(header->signature, JAILHOUSE_SIGNATURE,
+		   sizeof(header->signature))) {
 		errno = EINVAL;
 		error(0, 0, "%s does not seem to be a hypervisor image",
 		      filename);
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/07978f49-ba77-81a2-0eb8-4524f19d22ba%40siemens.com.
