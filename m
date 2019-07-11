Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI7GTPUQKGQEAZQ4MNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F165324
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:20 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id o2sf1286405lji.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833700; cv=pass;
        d=google.com; s=arc-20160816;
        b=fTUGZeDFFTmz/j3qboNN7qpZyaPLZQoRCojPgrkv89g2zBL7xQ0gVJnJlaeFKzRocv
         elQTPCemwprNbH06YNwMxD0WQkFsHOpC62dq/wu4e7hLL/ZC+xNlmrKLPnIiId0jDSBT
         /4z110SqRUh00jyTmUY1p3bMY+TPR3043jyBbrN8xVA+saOOTn8kxaoooUnKhvZ2n502
         hrVGnT5lCbzSgoQG8AqK4OmC0sA0k/qJrKvEuGgtqZ1ekK2QJTewK6j+U0aFHs7fT9+M
         6sm9Bun5rCQqJiUO5IxeJmyVS5+pDfq4BtNtRr+/w5LUUljjZUPKpBDSdSXA1/UD/yqh
         pqdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=4p6rY+FZXirw5nur+8ILJnmzVWx6KBZc4JZuVinS52s=;
        b=sOYq7h/u13W3G1KW1o6FTmUlpJ3C+d1PF7jkOpATeHVMofJU0O4K6lyFNxDaHx8wDW
         PyTMPqerW0838iISXLYj/D+vgqYyTfyzyG0WdgJdlO+btzCpuPPY97F4EouJY8EJnv7s
         keVisB2UMcr1EdgoGqjZTDQFctOyXj1aMgtHqHmRXOuPjwTP1h5GF+s9PLyRRnhn8Im+
         5UlDoIv9hqSGmpxtEJEPidimO7Q62BPc9hyEaW2g39BwMDijz8ZwDZbO1Ks4nk2MgqHB
         xvX9BTaZpGVcQd/O/8fNyUvXYyY0/YuvrhEJWrzGF/hEOtofcn4MxkkgVSdyKtoP8nfd
         4w5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4p6rY+FZXirw5nur+8ILJnmzVWx6KBZc4JZuVinS52s=;
        b=MawaEv8abfXnKA1DHQagYl/9YI1AZM6kubYqNk5OCIZCkpl10KRgeawPeS2ajMHpHl
         4pagAK0bGQXxRdAMwjdCtXMzCPIOmUrAEkI+JpSukjxEYeawNKXuxOwsMpQnBgbC9yxX
         NTwwncM8a2ocdUVq+o44BjxUD0msDf5DW6TWlFTZLYkYj0Sa6lmX08P/ejqIPgfBV1xq
         kxvVo3pyhG3ZZ9hMPS+0hDvaBLEfd6r+vNdxFMUoXGWMo20ijdpN0I1SgHI5EG17yUXy
         xnA8nUq/HdJhhS7f/y72x/uKtGE+8Cq0KUgAry9R/Z8R8F3h91mjEScG4Dk92OQJKf66
         s5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4p6rY+FZXirw5nur+8ILJnmzVWx6KBZc4JZuVinS52s=;
        b=AGNlhrEqxIDAryMiwDWovNGuRJdDJHu+yLJ6aTERiu1VGOQ1y7Plfx12s9lfKvHDNp
         zkgCzrG6dLgKEhP7tMKn1u0tCFEFC03NQtectPY2pWJQnvQ6/1mhiFkjxlW7bsrw21Lm
         UKx8kBcEyRyUPKVxV3eoCe7+h28TaWPxkJDHIjss/fUmxNLNnvLSifbKxIDwKR4WqMj/
         cx5TgPpFTU3LcSNuyVRef/U4R5oTR5z4fIkc0pVk/z8xdqq9g7N3snO7z3k9eh4MVAMT
         CgxzGBbrqXk01G1/Krvq1qpGN5udcfQuc64n8m/QyYdd0jbNfvpvrj5HfLzpheZ1z0ui
         7PdA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXpWGFhBHI4lAodCbC6lH2drExnlieFlIgzOZcW5osuqN7+HVNi
	JlKwXxwWU6bShCQKtEDfFic=
X-Google-Smtp-Source: APXvYqxpZ34VYlvCl/UgWJ7zW+JI6TutSDNjsHgyfVykVeZ6wvMDVRl9ww9ZKq4LLf3nSJNdqxZrsg==
X-Received: by 2002:a2e:9cd4:: with SMTP id g20mr1561654ljj.205.1562833700025;
        Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9643:: with SMTP id z3ls617932ljh.7.gmail; Thu, 11 Jul
 2019 01:28:19 -0700 (PDT)
X-Received: by 2002:a2e:800c:: with SMTP id j12mr1270535ljg.22.1562833699335;
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833699; cv=none;
        d=google.com; s=arc-20160816;
        b=iYkqowZ+h3xOJIlswzHB4/SXAY1AE1h7Epio1KUK+N4T7bHarzKarfIEHepBzFjF+z
         XKJtY1tTmLGMGebALovINX5wLEdDWgYfRXTLBe9L8MvvWugjSS7YlVrgNwxufqSO6gzO
         YB9EjKSqXiT7MZllQUsfkDbtrIRjZ4LLSdYN/3FWocOi1Sr0HXRo1IB/9VC6K01u5Hn7
         YVbfvs9sX8LiOcl3DR4gLWdkZfkkNpeTIzcNurz/l+airQMkzBX1DU2mlh5Xu2ZGQTGm
         rKiEUCT6M5Fe0Bk01zzEhtc7gcLJb0fW8Ltn/Vbht28q+QVvEO0+aL5JQq+/JAo9rMmZ
         r0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=dG6LZ66Bw3IYgTHujaN9uYYiwhhUWZnkD5UDIQdzm/k=;
        b=C3DnO58l+Sl9C6TV4ODEPGYJcdcK6ezinIYMx0U0CUUycN2zzNW5SFfHv8OTzhQAnB
         KYp/Z8M7ylN03x4WVNrKpPBvuElYFc9Q8xMAW4KzSHN1FCNIMsDpMCEIdLLAdcIDVOPA
         MRlQpqufbA7b5VPW4U6kdj8dEmgbHVq62eKdwr9IvOGvzpcS4pBl3VEXDeBoEzN9lyIi
         aNqHIGO14ttJpF3wSqJM4kpsz7eYs+KrkQSeB9txufGibX+Vyes/2+DMHCrC+1E/OqhI
         mEIwoj/bqahtA2t2XeYuwWhyNsEBBYuUALTeELXT96qajaAOdNb/j7I36IVe0/KugMVb
         zYCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v29si297938lfq.2.2019.07.11.01.28.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x6B8SIWx021996
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7R010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 5/8] demo-image: Add machine name to image description
Date: Thu, 11 Jul 2019 10:28:13 +0200
Message-Id: <f9659a2bfcb47c72cc47f69955ff0ce6953bc828.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
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

This will make the machine show up in /etc/os-release, for quick
identification of SD cards from the outside.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/images/demo-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/images/demo-image.bb b/recipes-core/images/demo-image.bb
index 1d8eb84..9917f2a 100644
--- a/recipes-core/images/demo-image.bb
+++ b/recipes-core/images/demo-image.bb
@@ -12,7 +12,7 @@
 inherit image
 
 ISAR_RELEASE_CMD = "git -C ${LAYERDIR_jailhouse} describe --tags --dirty --match 'v[0-9].[0-9]*'"
-DESCRIPTION = "Jailhouse demo image"
+DESCRIPTION = "Jailhouse demo image (${MACHINE})"
 
 IMAGE_PREINSTALL += " \
     bash-completion less vim nano man \
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f9659a2bfcb47c72cc47f69955ff0ce6953bc828.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
