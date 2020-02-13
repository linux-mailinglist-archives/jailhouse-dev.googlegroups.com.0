Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGE5SXZAKGQEVU5X7VQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0815BF43
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 14:26:48 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id y7sf2337308wmd.4
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 05:26:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581600408; cv=pass;
        d=google.com; s=arc-20160816;
        b=swmVtUmlRrqpy6bmpM9MmKXCnehD+Egorg14HvkbD7PEEX1Yu5TjP/2rDpJ3dfXha3
         V4jnE3/oy7I7aiDeu+60vLPBGjpobqzsvDSumOODHXpadPDQOqOE+dmODqaQf6V6Cuxh
         8S9EdmhZai3KzITVdDLG57Zv3RSXtR5kM4eUIMcpdx6YX47Z+oG4u3UY18XP3Ij9B0Eb
         MyXjG95bnXnVug4IUlQxFRcnwvj62Bj00I6FcRwcLJJ0iASZf3AikD93HBFmJMW4HJN/
         CM6RMTFPs6f5yO3vt0Vda7mxuPA/RuqiDV2szG2GsM+9JZcVm+w0HAXRZQjpnavaNPsM
         CHlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=0Tl87+6FK/6VcSX5xUBFAqI+JZ/BsOCcePva6Yx+79c=;
        b=OVECXeLhlt+UVKXvbUbsTqCWO557/ZkJrPIMFc1avsbqYN7KFevsS8sMMKKFqN3KvP
         K/2pdXVtJ2pn4LSxntmA/KWjcuwEK5tbz58rEbzYFfMs0wjzZyk9LPpQU9INxnP/bfmu
         9OTgCslTNHW82V6N18slyDpVYEtgNgv71ov2/QPWxNS4kc6T48FZNTq40wQq3d2DzJyk
         mFh/XuC1Is4Gko1HpWHT8zLPZQbbTBKi0Ev1jR8Ejl4ioRgnmBzbefSA+iBYNLHKctU0
         l7GV3L+EgsrvZ8vzlGkx3H2wtCAOg2opMwpDsZYgXm+TEOXQ4faEQ45Vb37vpbQn4fwe
         OYdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0Tl87+6FK/6VcSX5xUBFAqI+JZ/BsOCcePva6Yx+79c=;
        b=ozygtzBKagAb43JIQVJ7KLjKZhxP+m5LEtuY8NtOuCFoN4gkFb+8XFjxHQav2BsSNg
         vVjGLAbAPIedD7+xkgAZBuhR4+08NbJad6VjRlBqnLVpJCqBO8rAR1j95X+9o5oV6tIg
         fvyoA862mWQnUyzvYfzbDsoCjZR+qyHTdnz2c/pUwFpS0zx8KaMVciWXURToDIDf+gCw
         3IqxxXywfIETdYSEheooFN4Wmka5rymHCf3rTJ1yM2Y9iWSUdwE0GWH2nMA5iwHuCdOq
         279nj/zOD24FHIW29YNSf0PXAbx+x9iKJYaebKhLQ5pikS2mKi75FBFuQN8AOJmHXTEt
         EL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0Tl87+6FK/6VcSX5xUBFAqI+JZ/BsOCcePva6Yx+79c=;
        b=j6zE/hUR0OrYWLa2Umy7zwPh/rcrY8Xy5Ud2hR+rnQjSfKHGQVJJWMSt+pBtOSXMIm
         TxMGOEzPlzil1Zx85AcuAv2qVahuYftDhARmGezDKYos9KRVDnPP4anQNrVK/Xih0Sq5
         CB/8Aw51qnpfHTE6m+KQZOZqENHMFlV4bKV+oVdEn+aEJYyO8IJDBRci4hB0PL3K4sGj
         Uf/wGOUR+OL14ZM8kg1WiLbl1nj/V3rmiv21Ls2Lzx/w3ZKNxDmbeEGK2FbPbY77+y+g
         79EmbXzLg/77xHQ7RoVvVsF1SW/XDoVfKKqGwXc4FSoMWOQkKVDG1pC2VDzpYy2ZcrvC
         DASw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX5tlOOIAZ62Kymajjrri9zMjxQWrU0YlYmLWs/XkTOK4hPR13z
	TIdxMSi9xM1+uFCI5o5S9yU=
X-Google-Smtp-Source: APXvYqxPuvDRzGQVj3t9Y53Ov3HIBxcdKHZ+rDwGB8q1KwgzFy48SPtHjR64aEkzZQGsrO+9+E3Sfg==
X-Received: by 2002:adf:e446:: with SMTP id t6mr21538346wrm.222.1581600408705;
        Thu, 13 Feb 2020 05:26:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4141:: with SMTP id c1ls13113202wrq.8.gmail; Thu, 13 Feb
 2020 05:26:47 -0800 (PST)
X-Received: by 2002:adf:8564:: with SMTP id 91mr22358606wrh.252.1581600407938;
        Thu, 13 Feb 2020 05:26:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581600407; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvfOEvZZJX+kDlCiPllXHmjM7gNoUmjC6xAdVmX5kvI1eu/3LaiBOEzOekkiIBsXK+
         /Q14P/rL9Vxs5YFg5bImZWq5jqT6L1+9Qb7sZIVUjQp37zQbJ99J5B0c7A96P5gXAvBT
         /LneCTNBLyxUZgGQV0dWM2oGtszNnF1fqpCAr7L2nJQocrBAcGkc716o3VhogzHAAsk5
         B/wr+6RuhjaHYXGVSnOZL3eaWmBHXnCSCEBCDZoLRxOZ+wd7u3zNL8YZZ7GUtOr1TQID
         7JfXPSycvmmjBDwjfD65MlQuUwuZEXl8wsECH2oH1LhqAwJLW1ct1EC121KmShMEsbnE
         ZG4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=jUvTTSCmuhWOMcWP2Cu8xNesLg3kzdJP8FH2RaSHu4E=;
        b=JTvpV/WulOeg40O8PICjILl4mSaLqSusZWxZhxvtiREF6KQqrd2TyuJWv3UBtg490c
         oPJas0st1TpfIOn40xPapxjfrBkaeLma1sxrkbqyMxRVYpGtM2Hb3OvGFkcbZ1QHODnj
         ECv7U7TygMPjFgNAFBOAQIpio6wrlCYm6IRMndKn+iUGeLW++u+ffG0ed/jB7My18dTp
         wjMZr98TILZe+CGOiALxvpxvNGm4e31HM0po0BoJU/iF0BS2ekZ0sAiIH7SozRS/ONPu
         yugU54+rjdBWVzSM/nx+DbjXlb0znygc/fCd6LVnk66tlugQJCw2SfJK07zMFX4Bne5P
         3cKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id g3si88341wrw.5.2020.02.13.05.26.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 05:26:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 01DDQlE8032398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 13 Feb 2020 14:26:47 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01DDQlND016357
	for <jailhouse-dev@googlegroups.com>; Thu, 13 Feb 2020 14:26:47 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] driver: Do not WARN if a cell CPU is missing in the root cell
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <903375e1-5759-3d13-32cc-1bec55ce3a14@siemens.com>
Date: Thu, 13 Feb 2020 14:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This error will be reported by jailhouse_cmd_cell_create via -EBUSY and
is no reason to create a kernel warning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/driver/sysfs.c b/driver/sysfs.c
index a15a2787..a604afa4 100644
--- a/driver/sysfs.c
+++ b/driver/sysfs.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2020
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -406,7 +406,7 @@ int jailhouse_sysfs_cell_create(struct cell *cell)
 			list_add_tail(&cell_cpu->entry, &cell->cell_cpus);
 		} else {
 			cell_cpu = find_cell_cpu(root_cell, cpu);
-			if (WARN_ON(cell_cpu == NULL))
+			if (cell_cpu == NULL)
 				continue;
 
 			err = kobject_move(&cell_cpu->kobj, &cell->stats_kobj);
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/903375e1-5759-3d13-32cc-1bec55ce3a14%40siemens.com.
