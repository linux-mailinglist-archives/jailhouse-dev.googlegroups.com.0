Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMXB42KQMGQEMEWMDAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CE755B9FD
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id w22-20020a05640234d600b00435ba41dbaasf7177620edc.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336563; cv=pass;
        d=google.com; s=arc-20160816;
        b=HD5FznBsUi2IXlKYMNJds6weVWPJyiAUfWpP6mNTFMfpOPMwqbMNVFdBXfcbEqclYu
         ryw3dzxNBHXzdrE6ZlJAiplO3eX3RGmXves3VAm1DY/2tJbu7OUGs6Ot9seGw0hPWnO5
         rKDEjCV2rWTjqnTwMmbrOm5rE3/WUkg0EWIn9D1gTtZqxQqFVxbpp/PNMVe5COjIAGYv
         AmTRXrxq+yQgvYkB0ZjjuB/pLFbmf1VuF2XNeyuOH0/vbjRMrA8dpultHE2iNwiZBinW
         t9spGznkUwFFjwFFxuSQFTKFFAcNhCWyH75qMHdAWsz316j3eF/GcvlxnWD4e/DX4WCx
         T2lA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Pk7axzpp9uYxK/zyTPhHekxII6WQqcFh+Ndbb/7HbKw=;
        b=FPuxW7rN8PJmzhL5OJncKF/4Hi85OpeXGSAAelGkPdJNfV94r+ZpZCYkR5gkV1ZlPs
         aGaCQyjiA3dq+a7LhXRj+XfjKjkahIIuiObbDgI9akxp/2WkOggWOk3GeA/buc2NprIk
         /6CmOQ/Ri6a/noDiEJYxfM2ZqDUsM0fIceExg4b4j1OV/ZTWuQJkACQ0GObQA4xqaGjx
         vqXdVEmc47sxq5I2LsSBrdjW4c/AbPUGAGq2jYa+TZUXh4x6igXPkGJKJLNJK88ph23o
         4b1JVVIJnRhdKiWLWW7cPR/O2PxfdqytYZ3rV+6AEp3J54qYAhyPd0Dlh6TBUDQCYPx5
         jqeQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=C7HAqgHW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Pk7axzpp9uYxK/zyTPhHekxII6WQqcFh+Ndbb/7HbKw=;
        b=hgfdEHu8WMFIKPAElJryI0HCjQlUz5yO/QcE80l/8uOlOONdUVky04bXN/yEQR8OoD
         lIZuMI/2dUnxKixvW6r8qDV8Wq/YMIllUEFt2wpafI+2z2LEdg3DeZoxqyjg5sMXUKD8
         wjgTlLrCXA4ACBAfLzemO2XzRYvmJ1De+UFdPfSFPbhU6SfFzceIE+wp40y7MNcW3FgE
         niSKNccoPJE1BgbEDo9nvuDw6QPPigX4t+OKfn8zwgh+f+VKWa+T2IaVdeOsDZKwJ6u+
         6ByCYElmxrhyhx03jX2UFpSn7RVwN0ABxcIB/OlZnMGeJdjdZdY8ECy3gI3byekj/YrL
         /dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Pk7axzpp9uYxK/zyTPhHekxII6WQqcFh+Ndbb/7HbKw=;
        b=jTZqamAcc++aIS+9sW4dQiFeQGCpGnJAy+GOr6GFGh5vhiYQtGl0cKoHdR9ZVQe+ta
         CCVFAkd421d7/gZcv3gIzLxwo7KAJ2N+1dnbYsV2umD1P3V+jWGeHhXdLypJgEvQ+zR5
         WLaXmpa/IggBfZ4WgpvTXaV3uKdi7p5lwGJkL2YuzxfQIH8N4ZXrP9Q6quab0Lkj6qv1
         jSwTZOHL2jWd+r4silonRoHcC2M+eaQ6v7GM59XW/IwB5gD5FitZhoICEFKkVDs1dcOX
         Bo2M81ItXdoGsY0U7DHPL4Ce0QY3++3X/ozP1D9a5ZOIxXPIC8YnhPUrwGodA+K6Z7+N
         7nNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora//wqRt5tgg1gysNTvV+0O7KbEN3wsb/ONjQCo0lWCU1by+hcnd
	RsWc7MCgDQNWtIgjR6OyCW0=
X-Google-Smtp-Source: AGRyM1v//osGnBGfSCYSJJD6iw8KLEnyY4Se2opdhRzpG6tWa+SI5fcniIHUlH91Yl8VWSruwMv8DQ==
X-Received: by 2002:a17:907:6e9f:b0:711:d2cb:63d8 with SMTP id sh31-20020a1709076e9f00b00711d2cb63d8mr13318333ejc.232.1656336563027;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5ac1:b0:6ff:ab8:e8f with SMTP id x1-20020a1709065ac100b006ff0ab80e8fls4101144ejs.6.gmail;
 Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-Received: by 2002:a17:907:2081:b0:726:b8d2:fba2 with SMTP id pv1-20020a170907208100b00726b8d2fba2mr2026887ejb.686.1656336561496;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336561; cv=none;
        d=google.com; s=arc-20160816;
        b=cIaM6tX11GkDtCa4utWSwMmOvIZKJbYhavIlQa77gCUZMyBJGfTf5io0s3bb9Eq5NY
         CgVMlDHxks6te8q059fw6InNCKO37vj22qgtvl1VwsICsxR1e4F/Epcrpd68yF71D4Vm
         LR2AnbDcyVXt/yTXh7Ux+aONEEDsNIIs9wShDXz4Kd4ZPKY0y8M5wuYmc/rJAZdzi0Nf
         W/esIkknwGUd+BIh1xDIbaxtZdV/AROPwWeXk+VxAqhLKNJ4bzR7gA6Wk/NEiHvzB69c
         l7ZWe9S6JzvGZIhQxnwEJ2BgWltX+BT/Qq6WdsQlqGlVeC7fWOAHMZePr+Au/fwSthuX
         ayMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7oYOm2nx5rEKUIn6auCp7qC/7NXl+tfL5girultjT4s=;
        b=aUe0StM2gKAv9sM+05x8U+ZLthE36mEY91yJXMO9FjnnRJzRm/mD4xX8yjgH9NUjO0
         eG9mQPfUNu/OWWDbktDyaK1HNCh49C9LTNFW5Xc+0HPTlL4xWm9d0S1AipNsBnj75uJr
         FYMtXosvOAhOWY8tIg7WO4fiGxluGwCU5lBulV6iApYBth0fvlx2/us5CPQDLCXRQvf6
         byTFo6FHXAyIzF4MqfJ5YlRgn4WcHeYtlvclGyy8wT6O+Wggjw3obcDYM3lKwiAjuqJj
         diHR4Kst9cx+sc+ZTgoGhmjkQQZjwd/0FHeBtnc35sFn/IZfk8hyzUiu+dDjrzQ+cHF1
         l9fQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=C7HAqgHW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id v21-20020a1709063bd500b006fefa121de4si347733ejf.1.2022.06.27.06.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV915SKzxwx;
	Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:20 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 25/42] core: forward original HV memory location
Date: Mon, 27 Jun 2022 15:28:48 +0200
Message-ID: <20220627132905.4338-26-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=C7HAqgHW;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

We need this for RISC-V. Makes life easier.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/main.c                         | 1 +
 hypervisor/include/jailhouse/header.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/driver/main.c b/driver/main.c
index ef1c2a90..d5c823f2 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -513,6 +513,7 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 
 	header = (struct jailhouse_header *)hypervisor_mem;
 	header->max_cpus = config_header.root_cell.num_cpus;
+	header->initial_load_address = (unsigned long)hypervisor_mem;
 
 #if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 	header->arm_linux_hyp_vectors = virt_to_phys(*__hyp_stub_vectors_sym);
diff --git a/hypervisor/include/jailhouse/header.h b/hypervisor/include/jailhouse/header.h
index c5285262..574aae3f 100644
--- a/hypervisor/include/jailhouse/header.h
+++ b/hypervisor/include/jailhouse/header.h
@@ -77,6 +77,8 @@ struct jailhouse_header {
 	 * @note Filled at build time */
 	void *gcov_info_head;
 
+	unsigned long initial_load_address;
+
 	/** Configured maximum logical CPU ID + 1.
 	 * @note Filled by Linux loader driver before entry. */
 	unsigned int max_cpus;
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-26-ralf.ramsauer%40oth-regensburg.de.
