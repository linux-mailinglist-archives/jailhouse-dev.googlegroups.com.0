Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQVX5D5QKGQEAV2MSHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 3987E282CD6
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:19 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id v5sf3100156wrs.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838019; cv=pass;
        d=google.com; s=arc-20160816;
        b=bZMlkM9/SptkQ49gRFXgpvFM82/noe37dsq8gBep3zq+8X93ped5KprpH8LPXJTbCY
         q6mZlIeiJ5OOYbKxrjrUqJa041q54e8D7xW2QyBnDiHFAfCQYtizV9HDJFs/ahBC8OeC
         kBy9pQ/67bDhW4VlC+hQ4pXF8/cVokBbK6GRZfdbAqt1aCycfhPy5MssFUMtC3w98gzL
         hyhnxPuON3jtxXOVljocGNTP3J1ygFSFT4fUhjxu6erhf6Fx3dvKaDhSlHvtheXWma2d
         240HpKNEH6laScmOQknlF+07EPIxzUA5ADy9Vebt4nUnSwQZiMN2vlipncfcLS4Xiisy
         UcnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ILPk0TjXQ3vXxPcCOl8Zxu70C+Fssnp2z5sxw9wq7Cg=;
        b=qPhpn1ofBXix0lupwbG8Ks4dNcEhus+xCrNiLk242rPguQ/kdRvKxeUoGpn5mr/jCC
         uJxORisKcDV3yYveG6/mwp9bWswMG7crbQbpUHkkDgCBIL3EHddoDkNv+iX6Yx/uBaeG
         X4UnDWCMdYjShbs8u+Sla0SoY/RY9Lxco4uKtXEf7d8vvWwgMsEySycoyw0JXhN2pezb
         qMFYcwiMY2eNKZlFh9jotheyE/wCDxIHu3CRQhMcOOrxRuD45V/qbkihgpfCRUtOFo89
         8LwsVdsYVJyuxvtyes9E0u/IMYUV7GsSOLTCxWeEGjFUeJzcDErXkBI2D2GmKgt7NZru
         mZMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ILPk0TjXQ3vXxPcCOl8Zxu70C+Fssnp2z5sxw9wq7Cg=;
        b=fI0SICwHUBYUT2WAt3gFgcHGaToW3VO/sopW9L1a+q+aoePsQgVQ6H9ulerqNeEuY4
         2KuBfvXNI7mTXhk/zoy3WYlpU3C+xUzjOpthH4tLJAJyXLyggCJy17tjJBzPoek9KBj+
         Dc9A08kVx2iiF9po4F/JfpWSDvmCaqKH+o9IJZLgCY51rOJESmz7+9j5welIxVBKzCIM
         s6lTZ07RawkdKTbqvT4g//zjdKpyYgUa3n9mp3BmU936AvHh+QWZePgFVOFMeUsItGb5
         oooYnKhqto0WZmIUsWWTq8Yw2gls2B1Sz9g6jAAa6SyisglnT6rLRqt1visX2aACbRD7
         Yieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ILPk0TjXQ3vXxPcCOl8Zxu70C+Fssnp2z5sxw9wq7Cg=;
        b=NwFLkJaOcA9PpXfJYo7BFL+3UUT8p+h2g6aYaCX9uH5wdnJBgq9iuM47RtCHjcU80i
         +TeElnpArV22CgRRBGNnfgPqtzL/K3b2ZPwhlap4lDpZo0dibOfUUzrdeP6E10h1Q3ee
         8yQzCmK5oZ9BGn17cIucdizU0s2T6jRQ51D508MAxI49ixw0bgjbOqlBmdldkzI446br
         a1XQC7iyHWNt+ZQuSkFgXdmlwTS2LPTJis/ZfJt0qvGeTr9mQ/QYpX8+2duTYHqcn2io
         KDaSPVskFJKXwY6yxtiFEzcV6V5kKgD2GkNYGkj0P0OSH+gdl0JG8sOvZwBPXEDri3+2
         ieVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532p8oyfRw2PAgkAmQx0aXEnQBu208ruIREBBzqmnW9fZjr1AqdC
	/YTUKIDDRBsoUmWqcpyTZxQ=
X-Google-Smtp-Source: ABdhPJxGwZ8UhFg34eWYgKObXK+8vHWh/be+1nGyUJEhKLCD8NsXk2888xooJc1OHRuOJJgmHCUyBg==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr8162135wrq.254.1601838018970;
        Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls5161852wrx.3.gmail; Sun, 04
 Oct 2020 12:00:17 -0700 (PDT)
X-Received: by 2002:adf:df07:: with SMTP id y7mr2315535wrl.347.1601838017898;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838017; cv=none;
        d=google.com; s=arc-20160816;
        b=UISQ5Cred5bZMV0YZ4kUF+n/gfo3lDASXaeFh5mtsCqHBBTVmZQvTS8sea8n7AwgPB
         IFA+yDtYbPHwDlu/RZfXWWG0B+K7hk7Wjnhm/Tg3xdE/gOlxHzKfKYicIA5w/crH0I2g
         hUFeMLdjdU56JKuM+/UL1MoKieCOhWD6lsR7YR5o2ebi2OcpO3wFrAfIE5RTKRiaIFuB
         alAYF/owMvPp+ZzPwk86QN2Y6aW1T4KcbL+RmTdgzoEmskoUA+hnmnf6YljOdiURNdtU
         H5ZhB5BJ14WTcBCtTRHVwvXu4EF35hEHO0ckRWvqA1uSXd+zvdPsDhbZ3LSvgqgFE6II
         nKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=vqmVg/tFKkvwfDKaKrKXuBZGwtcS7ntQpvQjP3XDhxs=;
        b=KAFpdN26H2q13bb9oJjKImcmOKDP8HuGafizDBnYeBgMcweczbI27H3SoUK3+MbEtr
         OJzQg/uYdrMVN0FIRv/xQ1PvvxlT+TDpopqjQGTU0lFNzfsM5wvNXE7YwSc6mFU8LwFa
         KnFmv5vxy6ns/Z7cnAKQO3uQsi8oT13ZUIcFSdX+Wy7+7FlFHqEt0CHaGO6keY6LoAYW
         QQnjC4NhlPwPgQyFud9HjOYS+zNYB6FIBWRhFUzAA9j0i57BeRxJnH+rcrE2a/Wcdo5q
         V7j3UsGmbVj3/qZKQ+9TcQ2pBk5KDUH51lU9JslvAUlsh7NPTcCPcVlCjw1axkUrCcif
         exvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id 11si36369wmg.0.2020.10.04.12.00.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0HAR029855
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060v017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 45/45] arm64: smmu: Return StreamIDs on cell destruction to the root cell
Date: Sun,  4 Oct 2020 21:00:06 +0200
Message-Id: <e0d420547c1cbe637a40bbf3027e82c908271150.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0d420547c1cbe637a40bbf3027e82c908271150.1601838005.git.jan.kiszka%40siemens.com.
