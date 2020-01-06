Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNUEZXYAKGQEYJRGY3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3B131372
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:38 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id t11sf10686312ljo.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320438; cv=pass;
        d=google.com; s=arc-20160816;
        b=L+PTadJLjdlCb4xD7EPAsntFXI/IqopOtWfJ9svoIGuVzyVLdzB0QI5X8fVHHjkIjQ
         /Qe7U6adEYmQRN6HYefD3ZHon2+OweEOSj76/3Lq7BItgRUN1jr39U9jvjke5MgmLvly
         tWa1NY8XL3GMkhb3suw6lQ4HzSGQGNo151lvBQnCpZlpR2C8Br5N/FdW+bzZp9nLFCju
         BamwHnDvfT8+3IH7iObgOSoeshJvgT4i/w6jSfGvo4sh47M3esmx9Vh8YKjjA3lT8hti
         vmy460PnV1vjL0F2IB/rW0NxlXUnlahR0plC+OrsRgSHfLDXCKsHsQFz7/jWZDaeIo8D
         U6dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=UuCl1VvSwtEIbH7NPRk6ZWUi/JR0ZQav0Dj55XQBtJA=;
        b=CZkvdoBXBgqhUNdM3LLWNEtOZ4XArt3NlYGsF9PLMTUN5ezYpLVTsen7xt7wOroR8n
         5JIAqz27u+t1a2FiWFN1NiAaATpJ+8qnclon4nX6QRByLv+3rLzh1Xnkv8k3SjdM4fx1
         Mp2zngbdSdwJKTUmQmXElD/UMaA0aFXRETSAEwT6h99rEhGHTHd9buQS+baM7ZY8SL7O
         mCQ2TglAopIWIvdDF93e3RlFaYkr/ynHa1J+OziYzpSbnDQKAJormbNaRixYzj3oAuIG
         rkP6RO2vCCW941DMZfuCynZNfAu7EEqoFVKgjOO+Ctj0Qo7ng2acMTdpn2ee8BQNU7B/
         xk1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UuCl1VvSwtEIbH7NPRk6ZWUi/JR0ZQav0Dj55XQBtJA=;
        b=tPCixnq9Q2tC6pnGGC5E3sTj9hEg7/G5mJw7P2ETQWBBoQCUKQIyJWketgPqfVUlHW
         uNFJVZFZRi/3H60oGYYMNnCqs58nTFHvodo4/thbRbCZPCHLTLZV5L/8ZsXwr0ebDDV+
         iGucQ/AKezIZ0RU4hCBFbRD0Zs2Whr6ZEDD4wyz3SFERZLbloScCVeQkGpjWfATgC+Wd
         6WKH5dflJJpHzBCdFgk+JGy/BqaXo+NlUeu7/IyNmUl4Gc8+NnDABQrCidfIgiVrwrZ0
         Wg33cigXAwokqWZmSzk/BR2IS/t1h6qQVRPCv0DkAsl4DOJ/uWyKftWPnGxQ0vu5lYDT
         HyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=UuCl1VvSwtEIbH7NPRk6ZWUi/JR0ZQav0Dj55XQBtJA=;
        b=SYgyjj3QuVjfTXpp0E15mxfhcBpkkCMJIc62+LScMuzpEsyud++6/LAsyILJxwk7F7
         H2AlgUfMas2bTO5Wbp6hb9wQ5DydregteKXzolPxmUHqgNbuojiIxH7DBp1HU4Hia9Gd
         Vxy00qP+oxi12cN3laFZR/hoTlLuX9iirQfLR9tVd/xqhJSt0yHhdHMP5AGqRtSvROg8
         KNYdxa2HKC7zbVrQHGdgqmQmJQvgU1DHGv3upzFHqpKSwcS8EYcDp/evbVrZsUBVT8Km
         fml8XHWnfLcuUcPNuwqC8zMfEf+S3acYk87IeE3TV99O6PeMNDCpkrIqEtQi56tss52p
         +yOQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVIXfJxxr8DEpoZbhJ9ip7eSmsTqRyynXuXrVHILQCEqQBnPCsX
	6mm5lXoPPH2sXB/azVWfbMA=
X-Google-Smtp-Source: APXvYqzh7xyvp6Lu3XlCIKpbNNiNeXkU9Du6/f4IHh/k50HHpsziB8smPZkM6Sg0f7ou9OLMbYULpw==
X-Received: by 2002:ac2:4adc:: with SMTP id m28mr55252733lfp.26.1578320438499;
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4acf:: with SMTP id m15ls4157254lfp.13.gmail; Mon, 06
 Jan 2020 06:20:37 -0800 (PST)
X-Received: by 2002:ac2:4476:: with SMTP id y22mr57154813lfl.169.1578320437671;
        Mon, 06 Jan 2020 06:20:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320437; cv=none;
        d=google.com; s=arc-20160816;
        b=Ifu5yi1VxuBzFY1eTk/+iiirq6ZMBPthwJX0eJP+yuSZHLKDTG5plYR5D5FTgr85gS
         ZxnfEP/4qvPxMgkSbpk3Bjlkmx74+Kdct6yqQQdkQr/aTqxOQMrwBxsApaSScgj7upw9
         V2hgXmkLC7R2tAnOeRNaL7oPrO8btyUj04qLs4M/qzrVpkMHAccuGb0/Nx6vX1cq6tAg
         aZ27SRErEw7D2n9nEt26BQH+QbvXxLolKT0ZqQ/W5FLIQt8fZADKBYD2y4vbPJKk436n
         keoKUXyHf3HSqbLwQhVakNk+JurEoHJvIAPU83IeoQp5xK0hhvqyZsT3YveUJ+GLuZA/
         XaAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=PDolW+TUGJJhlXue0DAZk/v5psqddRROqMuBsWSQYrU=;
        b=vJWdjkZwpPw/7tvHPGOrk6p9fXI9/9Jiyf7c0rXosTbJneFymtkXIwXifVFkAA08S1
         ibvJa9O3IvZ7rs29MOpnrRbBacnNDJHW9uLQApPOqVx0uwjPMClFQHqRIFMf+qsSExCY
         06ZnCrlWs4Ia6TaKqtBbh1B4KGcXs3zmV6A2TpkGFhqZ7fu7IzQJg7ka/kXzitkw+sWQ
         IxyVz/adAh6E2gZX9PIqvYM1al8x85mOUvU/CFnRb+ZAj2X5RokQWtX8gszLxIXOVbAL
         uvDE5hSlUgD0vno6J3dnODD7rscZu+Q8gyjqFumAy0WChxi58zXRnQnQgsTdJ3Obgrdm
         ResQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v16si2696225lfd.2.2020.01.06.06.20.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006EKacA025668
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:37 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjA008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:36 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 02/19] configs: Add ivshmem protocol defines for virtio to cell-config.h
Date: Mon,  6 Jan 2020 15:20:18 +0100
Message-Id: <045c612237ecd050fd853137adda5e395be79e89.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

This defines the protocol ID ranges for virtio backends and frontends
along with a view virtio device IDs, allowing to create such devices in
cell configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 7694c296..d6920b1c 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -181,9 +181,15 @@ struct jailhouse_irqchip {
 #define JAILHOUSE_PCI_TYPE_BRIDGE	0x02
 #define JAILHOUSE_PCI_TYPE_IVSHMEM	0x03
 
-#define JAILHOUSE_SHMEM_PROTO_UNDEFINED	0x0000
-#define JAILHOUSE_SHMEM_PROTO_VETH	0x0001
-#define JAILHOUSE_SHMEM_PROTO_CUSTOM	0x4000	/* 0x4000..0x7fff */
+#define JAILHOUSE_SHMEM_PROTO_UNDEFINED		0x0000
+#define JAILHOUSE_SHMEM_PROTO_VETH		0x0001
+#define JAILHOUSE_SHMEM_PROTO_CUSTOM		0x4000	/* 0x4000..0x7fff */
+#define JAILHOUSE_SHMEM_PROTO_VIRTIO_FRONT	0x8000	/* 0x8000..0xbfff */
+#define JAILHOUSE_SHMEM_PROTO_VIRTIO_BACK	0xc000	/* 0xc000..0xffff */
+
+#define VIRTIO_DEV_NET				1
+#define VIRTIO_DEV_BLOCK			2
+#define VIRTIO_DEV_CONSOLE			3
 
 struct jailhouse_pci_device {
 	__u8 type;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/045c612237ecd050fd853137adda5e395be79e89.1578320435.git.jan.kiszka%40siemens.com.
