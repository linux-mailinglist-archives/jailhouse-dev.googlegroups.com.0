Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5VS3T6AKGQEZSX56BI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE632995A4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 19:46:15 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id t4sf5134057edv.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Oct 2020 11:46:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603737975; cv=pass;
        d=google.com; s=arc-20160816;
        b=y4O89SykOjntCA9W1CCjTKw27YuxXE+yL+MLTfqwOWffjW1k44uFYpvXozAKKQENOM
         74GqhwIPad4SS6unylL/lRyj2kjc0mymCig0c6wL4a0mMNQovpAxFQJtoB7LZUOtPFiq
         iKFjJ0JbYJVagaH4vYYQXEFnA6NfiE0rd716voJHvCCKGuhJzfpvB6rgNfU0byZjAsp1
         zBz4Wn9clwF14egYWjVRoItvHxVsWR3wiE2Oh/O/4kMarS9I79Y8MF8CVfEdKClLggCb
         HIXkwyVvG8HTPOULP4aGLYHNH5t4Ppbi7XYz+spa4IQYtzf4FW/Vg8efhpuJAKukjBJ9
         cFrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:sender:dkim-signature;
        bh=MLQXaGLoxVsTgA3fT4VzV8R+UAgKD0LieXs1naGucoI=;
        b=iOng2qVRrgkERRwTR/Tcb3YiGUhDU9IMjgBsmjnrnxDiZXVEs9KiS+5dlWe/LVh6UV
         Fknk3qOwnJXKVPNfiAuZpKPfebPvr1fSm4opX2rETqHtkxzk0mdebIkAh6JNQqMQZLQu
         xajnXAH6/ZnOBZOKW7Hjhr8ho8Vt+U0skbroGK6XDIIVd72PK5V907QlA7jGPCntehPa
         65N5zAf+/C/YS0ybK0OV0HF7ivwYa8Heu0BV4NJLU/IuO8Lynrd70RWGaDcHxw5ExR3e
         dRhri4HkseZKHLaU89k6D3HGrW6iU9nk8eYhAcU8UX1rtXlXJg4V94sIobYeibmT+HgG
         /3OA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MLQXaGLoxVsTgA3fT4VzV8R+UAgKD0LieXs1naGucoI=;
        b=TEeo7KKUnBva7yyy4dU3WGKRNOZiV1AEvHRv5RDyesCOrr0effIFBZpe6aTis8QR9A
         cYZGFfJyLeCnVzELLzQBrwQTI13IxPVGEnbFlnzy/mLIEkgtCqnwgKEuCVsoscdgbsJT
         Enl9x7ekqVNDiTREntdqarWaKwO1JocZgopnepD1c5Gg6Ikj0ZCZ4gzSbL/78VhgjGoc
         MoAItX5qUix3tv9ws8GzyWLI7cuC9LLPP0Ki1u7I/DJ9RnIpaf4j8h2UvgQJ2a6bslLo
         8H5MJg5wB3iujrcK+qW2gR5dtvxAr+zOkVAWiI8GfJLbz7oJbkD6TdeMZ1G21HxtSIGB
         jURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MLQXaGLoxVsTgA3fT4VzV8R+UAgKD0LieXs1naGucoI=;
        b=MIM6ewzZwRE4spMAIZGmHln/FO80Xufa75eMgt4Ft9svTMM+FL1r9zf3Z/KkhILfDd
         aaQmK+aTDP73qX3DvqIyOlPXt+htigFYGvuJhyW08bsFUP2ur+ZIBa9tYlR+XQ5Emjyd
         5DmRFVAtUPYJ4yuxHMR/8MsafdW8nHjFyp8SlwyEKNHbHwQB+2LGMS6z6/30Ly+6+dzW
         hG/8H8cd0zk1pEl4h+OLRa3uikYczxCiyolund8yf5i1mrW/xBkiVKQgaIVGfAMcWWft
         t2O7FQnbmmzW/0SEl7HBuRKCZ4cFFRe/OhhP+3D9hEh3MifBsO/VOt+Pb3v7PJgzqRk6
         AOHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531+Emwwz8eHR/g39IhZSeGvQzY5hUqFhKjYIs7eOAFL0k+mQT6U
	G/Rt38ITJoSxaqnDiys+3W0=
X-Google-Smtp-Source: ABdhPJzIk3IhodQzdGPVwnBFQ4Kw/WFKABrtm+vab7ugQ0dept+IXDeeH9QmMRyyAKj1h6X7UgLiVw==
X-Received: by 2002:a05:6402:1c8f:: with SMTP id cy15mr17148958edb.335.1603737975236;
        Mon, 26 Oct 2020 11:46:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c04e:: with SMTP id k14ls10428536edo.1.gmail; Mon, 26
 Oct 2020 11:46:14 -0700 (PDT)
X-Received: by 2002:aa7:d28a:: with SMTP id w10mr17297200edq.192.1603737974016;
        Mon, 26 Oct 2020 11:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603737974; cv=none;
        d=google.com; s=arc-20160816;
        b=CeKdtbRyXtKdXBtM6zl0isd/CwvwOAqMhbc157UEUQ+rglz8gHYvfun50OzyV6ve4/
         gfVpRwrORKveuEcrmGAiaKqCzS2qEBaIywPBjYzJiNxgUCQwbFtweu3zm8zc0y4NMaY2
         lYpMZ8hMpLa37+i+uLJqyneBdMaiXrfoeMtCDiybHhwzPcySo1URpEksYk0ApuO8ZMwg
         L8FojXT7jntYrw55nkKJYcCvo6aZVvwduEgv3f80e6VpQhOzoJD3XHqAkfferZGOBMax
         S0zYwNktQgV36q8TrpCP2JstDYqG1wZPVeyl5WKwEZpFS+CrZCmyH7cZWjFCDKPMpRFu
         z5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject;
        bh=syILLZl9KndxKI4+zWH0GqK66A26mrcmULeQHucehF8=;
        b=Mxt4y5vKhF8A2ic0BgW4D4ULguPXyMPxWN1SwB5tYsPYynsyhHE8Z0kCcWcX7QE5fT
         ZYms+v1DkpXitmlCpZ+KDg2VKSTEIhlw7qst062lyLebcRwvXDo7AJ2sB+26v+KWBbV8
         SnvKiuVBLLoqsrqBNvAKaTndKTsEhzD7MsTxBqO51At/BoTnzD1qNpv31FGQylpZXj83
         TbfKnUZcR6HyWsyfUKmOgr9GBrLMx25J1u8K3TOEixZ3g04t/NKJRWJoNWkLDYVUChFb
         BzmdoC5d7Ush3gMJ1y4gGt+r2dyLCtL4+n7mu4mhwB/zq2QV7oj8BJk8BYNcgqb5JoUN
         AHhA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id lf25si388632ejb.0.2020.10.26.11.46.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 11:46:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09QIkCHY017750
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Oct 2020 19:46:12 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09QIkC3k031831;
	Mon, 26 Oct 2020 19:46:12 +0100
Subject: [PATCH v3 05/33] arm64: smmu-v3: avoid shadowing smmu
To: jailhouse-dev@googlegroups.com
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
 <20201022175826.199614-6-andrea.bastoni@tum.de>
Cc: Andrea Bastoni <andrea.bastoni@tum.de>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2db25e92-63a9-3885-fadd-02adcd3a1a53@siemens.com>
Date: Mon, 26 Oct 2020 19:46:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022175826.199614-6-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

From: Andrea Bastoni <andrea.bastoni@tum.de>

The symbol "smmu" is declared and defined only in the smmu-v3
compilation unit. Give different names and pass a pointer as parameter
to preserve generality of the accessor functions and avoid shadowing the
smmu name.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
[Jan: refactored more aggressively, avoiding redundant array element lookups]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu-v3.c | 35 +++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index 2f57868d..5f75e862 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -360,7 +360,9 @@ struct arm_smmu_device {
 	struct arm_smmu_evtq		evtq;
 	unsigned int			sid_bits;
 	struct arm_smmu_strtab_cfg	strtab_cfg;
-} smmu[JAILHOUSE_MAX_IOMMU_UNITS];
+};
+
+static struct arm_smmu_device smmu_devices[JAILHOUSE_MAX_IOMMU_UNITS];
 
 /* Low-level queue manipulation functions */
 static bool queue_full(struct arm_smmu_queue *q)
@@ -1040,6 +1042,7 @@ static void arm_smmu_uninit_ste(struct arm_smmu_device *smmu, u32 sid, u32 vmid)
 
 static int arm_smmuv3_cell_init(struct cell *cell)
 {
+	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
 	int ret, i, j, sid;
@@ -1048,20 +1051,20 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 		return 0;
 
 	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+	for (i = 0; i < iommu_count_units(); iommu++, smmu++, i++) {
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
 
 		for_each_stream_id(sid, cell->config, j) {
-			ret = arm_smmu_init_ste(&smmu[i], sid, cell->config->id);
+			ret = arm_smmu_init_ste(smmu, sid, cell->config->id);
 			if (ret)
 				return ret;
 		}
 
 		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
 		cmd.tlbi.vmid	= cell->config->id;
-		arm_smmu_cmdq_issue_cmd(&smmu[i], &cmd);
-		arm_smmu_cmdq_issue_sync(&smmu[i]);
+		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
+		arm_smmu_cmdq_issue_sync(smmu);
 	}
 
 	return 0;
@@ -1069,6 +1072,7 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 
 static void arm_smmuv3_cell_exit(struct cell *cell)
 {
+	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
 	int i, j, sid;
@@ -1076,46 +1080,47 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 	if (!iommu_count_units())
 		return;
 
-	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
-		iommu = &system_config->platform_info.iommu_units[i];
+	iommu = &system_config->platform_info.iommu_units[0];
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; iommu++, smmu++, i++) {
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
 
 		for_each_stream_id(sid, cell->config, j) {
-			arm_smmu_uninit_ste(&smmu[i], sid, cell->config->id);
+			arm_smmu_uninit_ste(smmu, sid, cell->config->id);
 		}
 
 		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
 		cmd.tlbi.vmid	= cell->config->id;
-		arm_smmu_cmdq_issue_cmd(&smmu[i], &cmd);
-		arm_smmu_cmdq_issue_sync(&smmu[i]);
+		arm_smmu_cmdq_issue_cmd(smmu, &cmd);
+		arm_smmu_cmdq_issue_sync(smmu);
 	}
 }
 
 static int arm_smmuv3_init(void)
 {
+	struct arm_smmu_device *smmu = &smmu_devices[0];
 	struct jailhouse_iommu *iommu;
 	int ret, i;
 
 	iommu = &system_config->platform_info.iommu_units[0];
-	for (i = 0; i < iommu_count_units(); iommu++, i++) {
+	for (i = 0; i < iommu_count_units(); iommu++, smmu++, i++) {
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
 			continue;
 
-		smmu[i].base = paging_map_device(iommu->base, iommu->size);
+		smmu->base = paging_map_device(iommu->base, iommu->size);
 
 		/* ToDo: irq allocation*/
 
-		ret = arm_smmu_device_init_features(&smmu[i]);
+		ret = arm_smmu_device_init_features(smmu);
 		if (ret)
 			return ret;
 
-		ret = arm_smmu_init_structures(&smmu[i]);
+		ret = arm_smmu_init_structures(smmu);
 		if (ret)
 			return ret;
 
 		/* Reset the device */
-		ret = arm_smmu_device_reset(&smmu[i]);
+		ret = arm_smmu_device_reset(smmu);
 		if (ret)
 			return ret;
 	}
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2db25e92-63a9-3885-fadd-02adcd3a1a53%40siemens.com.
