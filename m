Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW7B66BQMGQEAXFHBYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F29364CCA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:35 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id j6-20020a05651231c6b02901abd14b042csf6675750lfe.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866395; cv=pass;
        d=google.com; s=arc-20160816;
        b=QM0dBpOMHgfVF+tods69P0n8JcR45pmsvHE2NijWwhOLakWD/7krpqgFfV6an5IO5y
         S7zVmAMVg2zklSiZ7MYjx1D3dt9nT31JUctsXjzF7z9H41h56nWE8gWXrfYZhtyYlESv
         UORSOX4Vf0wy0T3fdItY9FrpyKIt575iX052e3Ue7B4IImb7w2Prmhdw2cnihsVJ1Nec
         Y+cdLJJCOkbHUA7uuwGUIzTeSPj8WDJ7rQ/FYu1tZp6fXcursxEfZsbT313Fv1BTD5Dr
         n7dT+hrF+qG2qpFKX711yBTBuvIy45teD5bEGvUnHsMSZXigW9ez4hvKFjI95LLQMCMN
         v9dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=pz90qf+uLu39IJxMy3pxExyQCFt0m5l+pbcmdhoOFuo=;
        b=LxXO+/ruuwx6n/48iTpssAEnVB02CT4kq5q74DhaFvB2ERbKALHuCohADky73jdDav
         rEIVfZPqGNGj/NSLhFQClXJq7jVfcgX1UXSCDIKTHNhqz9N0k7JzYa1ZLrL57wL5YGkC
         4L0jKEfpO1SrebLSZ8hEKpOUwDl64WtZiQJznkFLa0qC26jUCXeb9XX+VewboajVwutF
         ktEScDTEJePkFUUoqxE7Xr4H4QO8BOqs+M7FS6IqF97JT/dr2G2hiaabvRnJIy7elSbx
         nWw9hdpux+lK12KYgSyUOzgDZTtCDNHJKcwbmrDEnAI7fJHV6WAwOk0QYs1LQ9n7sx4n
         y/5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pz90qf+uLu39IJxMy3pxExyQCFt0m5l+pbcmdhoOFuo=;
        b=lVIyP/2jyWNF7qxrjvrtUOXAK5x1ptJx5/aoV6CnL/h1kNitXOt7FskHX/99M/iZbq
         wsvsHDZwEJpB7UEyXbOgD4AugZmh9v0/VEtpUNbWXUzgak02l/JA5R/P0ZCEXoCTJENh
         38985NyWyAXdwWEuvV2RzKa+FP1MlV2GUe9qIh6npjMGFTmbb2tyGb0gRV8AGnKXt2lh
         RVdi4fudmw6SbdhS0UkZSAjcXJg8tS2+Av42ZKpMN/LYHKQCDCPoI/DXvtqllHF8U9ZN
         bAx1i7+EXn6mr45O3ZewIjeJmQHkPA/erU0zI62WECzmXyZWpDVSspkSfr4AcN2fthZ2
         1Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pz90qf+uLu39IJxMy3pxExyQCFt0m5l+pbcmdhoOFuo=;
        b=l+rtXiTjx6lXODGw3JjpGfh4577C+RS2Vm8YWiQ1E8WKLGGyAtHt/f2njt7O7m1kUr
         W+yF/xHSM1BrkA4FN6+E3OWb0ewEA0Vu1OJvsPlxp/A1/WBK7KkJmv1RUAqMMvy1sMyR
         wEEQMlH6yQIxGYC9swd8CifN1sYyT2gX4xs0o4LrWlOCOAdEz0J4UCr4TxacG7r7P7FB
         TN8jbugRH5pRqXnYjJq8/W91qSdXke+ZS//YsWLdMbGvHRgoqLWUSgFakeaMRjdBkMuc
         yUjYJZSGcuywNETPFzHGwGTPN0hEpazXKUQS8gKB0qOq7n43W9dtAjRjRhYtOd/0VXYF
         5c6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533LLwc+0Aua19IIJWmGOrMQ+zTP2VBxxVzT0l0x7KFXBgI+P6Eg
	C9yYICZ92A/r4PO7YGdNiII=
X-Google-Smtp-Source: ABdhPJz5UAtmsOt3bDxiv5OTj8xqTVX/68uPegt1vCzeWv390fdYl6VpTysZv5lerDmBVGg2hrY+HA==
X-Received: by 2002:ac2:5a4e:: with SMTP id r14mr1512180lfn.483.1618866395570;
        Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a48:: with SMTP id k8ls4625211ljj.10.gmail; Mon, 19 Apr
 2021 14:06:34 -0700 (PDT)
X-Received: by 2002:a2e:8490:: with SMTP id b16mr2062305ljh.390.1618866394397;
        Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866394; cv=none;
        d=google.com; s=arc-20160816;
        b=FeX9l30d2P6EwOzrJGW4oRaS9eaVD+mCeCQeW4npR2dhnqQc7fooonZL0yzGKAkxiL
         KosdDvBGOWDJioSfNpWmTRqLyvrMkdUwPKtAVj8NKAWaSAsZkaUn2vGccauqDf5toQhn
         zPz0iJPFDc0b1mfaKFwVKnxMoiA8otBcAlpaw6YbFcDqchF92jDBTbGQvEqlisT6y+hU
         gkt1QP+iExnUp9xuwgjOS2yhl8zHJMWxjoVOT16SJ8Cip/03rfg+ZPN9vPKScwfjMiKf
         zyQihUZCs5IIysj2zZGcdX1u7RrUcBJKWA+/T1cLi2h56cy6acAPQ4XNlLeM9A7XoHaj
         ws2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Q/bRrT1wCOaMlxDxPcS3qU3qd4mlje1R76E9EAOmyVY=;
        b=sdFn2CSWKBzI8pyVcYGlMFRyr+oWtv6OJH77utPBVds5v/ROBiG29lQ2Xxz3FeI3Sz
         M63j4P00ArRqmTLBfY69LnXVLm5HBzBQPZFLOHro3TDCk8aG03VQ3SK4ZT56a7lBmEDP
         7MMo6PnS+puOM+NPdvYmolxOiGZ/SXDRRs8v7WdNN5njZqeaaCx2TI4n/jrwIlmla301
         4uCTQODQiwAs3lTfOY5SdXU0dtZyi3czPIL3fAs3UiJkg+yPO+uwprrZkvfIBbU1PZhO
         MPLjYMPbT0dL/CW1A7Xko7fVYS2EB7wPhRXQa2CMFspxli5SNt0iBX6wKTbEmEW3+XeO
         OfRQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v3si1030211lfp.0.2021.04.19.14.06.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6XOa022622
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:33 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpf015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:33 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 12/20] non-root-initramfs: Purge buildroot download cache on cleanall
Date: Mon, 19 Apr 2021 23:06:21 +0200
Message-Id: <ea120f64f5dd2bc7669aa2bbb481f78a4d131cdf.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
index de8c296..be1348a 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
@@ -35,3 +35,5 @@ do_prepare_build() {
 
 	ln -sf ${DISTRO_ARCH}-config .config
 }
+
+do_cleanall[cleandirs] += "${DL_DIR}/buildroot"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ea120f64f5dd2bc7669aa2bbb481f78a4d131cdf.1618866389.git.jan.kiszka%40siemens.com.
