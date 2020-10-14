Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY7NTL6AKGQE37VLDEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F2228DB75
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:24 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id v125sf287018lfa.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664164; cv=pass;
        d=google.com; s=arc-20160816;
        b=1JNOlYlF9jG4P4HYVw7b2aGKqgkhYuWUSpXY7WsGHQpN6hrgj9QTFdAcPNGIcAg4LD
         MImdczcEhO3dMNBpXWLuI7Ij4UalG4xAZsZogMEFpuCjcJW+bWpvTaHG5bUfZQiF+u7p
         XRFtL24OAt7VL6rYdYl8wlSpg0s5ewMZDdnumbOV5IgjJgB+o4PEROlxC6S7UxcVN/W6
         3Qwocdg7LjVUs/4vHSIsLihVAWP+KLFZPu2fWVRAQTvuzGbcCIQbfng08uwX8zPalH7q
         d5359MjKME0BYANSOZ5mZvrhnYIe156B3hUyz0N9x/qiHsLpBu+TQDY9RWm8wToMILRv
         +miA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=wx8VCMAF7tIRWhdd6tdYJSmjHGMAxt1pihbs/ycuXBE=;
        b=aK6TFXjbU0Vv2ISNa2W9ED7m+1Y72yQAZkjkmwcskRJdREEyqeP/OJNPNC9s5C8s/J
         CbVMna4c5EwIS1/75F23W0MfSAcHkwRSz7t4ePrUSjvjEN6YLVNEtwgsJuQVGHBdbM+g
         10NT9BUseyXU4A/EFKxKIbvFGD53RHjpMHFlwhosV8sS2gy+Tfi6Ifopasa1krb3fPu7
         ZnjOZiTt3wGisYkakyFx+aKzql2RJUwy7XCfUci1uXTKgfl1N24XXoCZpFOjAvCukvdN
         ivd9BuIpOz3Poyk03QuInozhG455ypRv0eMxPn7kAXEEuZSOAro1PiRdPL77rGjaQBiS
         Fpcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wx8VCMAF7tIRWhdd6tdYJSmjHGMAxt1pihbs/ycuXBE=;
        b=gGVvm/LfQt3UCWVkBiq5M49gb2kaxzq69HJqkM1QBKgda/rhCqXIjrgKVmEQncYoru
         rfz4qY+iZB0IIe2OcIH1xQFVfSiNrxlUM0LFcd4YNmvJCXifcNLdOh+kt5Dd2po9qjUc
         czAH+1mEsB3o/nIiNxWaX/xzEAvDwq5oBe/Qm78tzSSmqBq4+Z5tzZgPCT2oczEBTvEW
         JqoKaixZVi3PUIRG+rCzBgOF2ooUsNzqQUDxUuAumxxlWLY0WnBAHdxluFhXdQLTmGN6
         USJR7uvwn//hCS9N6oLBsNHSL5G4Y6O4an2P6lzlfszsK91R2g+zFPup7a8SVivwLeN+
         DcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wx8VCMAF7tIRWhdd6tdYJSmjHGMAxt1pihbs/ycuXBE=;
        b=soJI3XHen0K8TgZOkq9Z5Qkjk0y7IRnyVi2TUMPiz8e7YxcleIKylMO63d2G/VHjZ5
         JxMjroannfgjCdVi8IHj/Bi7nAb+Gb3k+oAxNonu7yP7BKlok4Z5RNZEB5rraJLGphwQ
         n6zsh/JhaunV+0U8tbqOXMzEvURTNGhRiqq9tEQlAjh5YfZ8dmmQnEb3xYTQ9bE7Lxdk
         ZItg2M4yjXsWB5SYlpmY8blVSVnZO7jdUpWXrZj8gSSMEWVX/2OYTrbbAL3HJ6Qon5Kt
         FWpJlgtwInEnttYmneKTGRjl3zlfdSRtggL+dyTl9K/fQFkJWiLHHTbh64489xbJbJK8
         IJ4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533GYusGxs9kdZfJC7AIJrRaW9AkVtaJ/H6/c/dNKbTlOBX/XbRH
	l7Ytbnkhc3brFe7Yf8L2LcA=
X-Google-Smtp-Source: ABdhPJyMZsQEhtTVFExXmbg0PO3DrDOQLaCNWDKUxla7n0ufkByNxWFYqUwRNjqD9NmwJnBXTnSw8w==
X-Received: by 2002:a2e:2c17:: with SMTP id s23mr1428913ljs.436.1602664163817;
        Wed, 14 Oct 2020 01:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b016:: with SMTP id y22ls488273ljk.3.gmail; Wed, 14 Oct
 2020 01:29:22 -0700 (PDT)
X-Received: by 2002:a2e:9652:: with SMTP id z18mr1363591ljh.410.1602664162531;
        Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664162; cv=none;
        d=google.com; s=arc-20160816;
        b=1Bf+cfLnF1ARR4jOBWtGhigSsz6fAJ49ybnz+xzIqaEVGzXoCbCFtG0fLBTkLfSvZW
         SNEkY4OHHpcBhVEVfnFoPCVLXDN9DQbrcx9WfAzWlLrxWqj82J7HOAM8PDbTNu4UfgrI
         MdCoz6CKQlCpev6fcRHf2stvzhbBbxyP3TQF6sPSe4ug6Q3ZG7eNvdXQ/7aTDD/dP849
         0oxb5XpFPWBpCa6rZzS14ps+++DH1DNAx5NJA26QvDWjK7kA9fB+9dA1NfrQ9vj2hErz
         TVVDk/zaVWuy+vry06lrDbFKtmuJ5dC2x/RLaFejIIMkD4I28XjJGoi5yLMDVR0AKd92
         lAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=vqmVg/tFKkvwfDKaKrKXuBZGwtcS7ntQpvQjP3XDhxs=;
        b=vfN6oDzBEEM5CM9PJOIkhg40//YeH1LrVLXsvNzLbdDd1QQyPnaeKOyuHqWONoJcm2
         KfXhePOTDz8YXqnvxqVVJq+jr+Czw0GcoIOk4NHNrvjVd2Jnc0+dHAVICVr5WXBorY2b
         JJngeLNQ+6y2M5fYAriHQSoM5Ga7URuVxZRe7LHacJ/ykCoWSmSTTn8OtSxHourWDHkR
         SnSewNYIGID4jl35YSW7tSE2r4qDy+y+XZ59gtrctnPM0X8Tk28hRh+vLi5CN/YiwgVF
         +r2lfhT6UWW8fsUQtfhIVnXHXHqx8Y9GIGMvMKP9ezf+z4HiLQ9JdR/T+/r/pvNC8RBt
         1d0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id r7si41454ljc.7.2020.10.14.01.29.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TL8w024030
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:21 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJW002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:21 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 46/46] arm64: smmu: Return StreamIDs on cell destruction to the root cell
Date: Wed, 14 Oct 2020 10:29:10 +0200
Message-Id: <e3c5120102eaaf1a1c7244265329812c8d0c702b.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

If we stole a StreamID from the root cell, which happens implicitly by
adjusting the matching SMR, make sure to return it on cell destruction.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 347ce223..fa583745 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -454,6 +454,25 @@ static int arm_smmu_cell_init(struct cell *cell)
 	return 0;
 }
 
+static bool arm_smmu_return_sid_to_root_cell(struct arm_smmu_device *smmu,
+					     unsigned int sid, int idx)
+{
+	unsigned int root_sid, n;
+
+	for_each_stream_id(root_sid, root_cell.config, n) {
+		if (sid == root_sid) {
+			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
+			       sid, root_cell.config->name);
+
+			/* We just need to update S2CR, SMR can stay as is. */
+			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
+					    root_cell.config->id);
+			return true;
+		}
+	}
+	return false;
+}
+
 static void arm_smmu_cell_exit(struct cell *cell)
 {
 	int id = cell->config->id;
@@ -468,7 +487,8 @@ static void arm_smmu_cell_exit(struct cell *cell)
 	for_each_smmu(smmu, dev) {
 		for_each_stream_id(sid, cell->config, n) {
 			idx = arm_smmu_find_sme(sid, smmu);
-			if (idx < 0)
+			if (idx < 0 ||
+			    arm_smmu_return_sid_to_root_cell(smmu, sid, idx))
 				continue;
 
 			if (smmu->smrs) {
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e3c5120102eaaf1a1c7244265329812c8d0c702b.1602664150.git.jan.kiszka%40siemens.com.
