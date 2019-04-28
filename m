Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBPODSXTAKGQE64WSI7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3d.google.com (mail-yw1-xc3d.google.com [IPv6:2607:f8b0:4864:20::c3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFCB5AD
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 10:18:07 +0200 (CEST)
Received: by mail-yw1-xc3d.google.com with SMTP id j62sf6323146ywe.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 01:18:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556439486; cv=pass;
        d=google.com; s=arc-20160816;
        b=GzR1AZnomnPhMjO1KifAFCHw1r2UbukNcBECn7LEi9fN6W/e5TzoqTVsiFF3tQd60F
         b9Ct8pb1sPAUCZ+ngL0oXOmahUWUx7W+Q/POFFtSkbXLJgFhh4R3/zpE70aiPk0bFa7r
         aGds62XLYAQNMtRJ1aNuJ9i0Fh6tWZxCfIHVzT4m3L1x5p2ARQz36LlwQcusqxx4c7NV
         DVV2TVOiG2vNupaZVGcKU9aXnHAY+G/MEaSv7doyB7mz8pRNdXv/bo81T+Ou8JhAmXy1
         g21splE1OaHReqtF+wj9gTc909zbaJfCq2cxggNyfhndIG5KA3qUefN8ZsGZ0FR+wvv1
         to/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=emIijWDM8vMTozpIUkbbgKwciX3QFl4r6ptZfAgB9W8=;
        b=gX/e7cxO3bqrgPQTdgvC4b0JblBIFqGe5AgDtJf6ZcWbMJYFgrOM9Rg+iFsjWmpRt7
         zfmQVF+J9sZdv9qNKeXXj9ZRq6KYsaAJS8Ys10b5waUHoLdj4Qx59mnKN0xrmwdtG/Zd
         JtBLgb/izfM5sXnwzQK5440ylczI9TRYOD5CjIVsRPHgUMQTH+UNeotMdXNvEXz6fzCb
         9fh92pQXu7lSRXI9p9nLkAgK6RUl6GeVaHLsgx/wuYKAbzVAAHZeWJoGglIxl2lZwUcl
         IWsJPXqajUKlKColmZt8K9igczMIiMq2M2Su4aWGNbyBUX4bVwJ8ioSBKcJxdFQyvvOr
         iGGg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=o1LLSLgB;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=emIijWDM8vMTozpIUkbbgKwciX3QFl4r6ptZfAgB9W8=;
        b=H561vGh/kNh0aorQ+vckcgZg7LPY+vZLFKVZxj+/OAtRsTU691CzZNDlLuc24ZopeM
         A5MZEa/761FrEj/0yulpEPqtmFXQs69Zkw31E5AU5N+Cq6IBjXSD0xXLwRgi5bB4hNhj
         jiMNd3XBl591PU2kECruySB/fo1W4hB/tLELPNBI3yQRAqFhgAIWiStTjUpZ7QA/fnHR
         BrxYrdog35zNjapFdtMSmejw4gThI7vxcRS0pAGtFPaiBqB6XSZeFDwNHbgtGl6ZdB7b
         PcZc/maQXmbZ/AGa/4igC8xsbEk8+wiARV+3drcgBffJ1lJuTvbKWiznyQtzmLqUXPkY
         Ml3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=emIijWDM8vMTozpIUkbbgKwciX3QFl4r6ptZfAgB9W8=;
        b=qY6tAnFEPWUm53bLtm9zu9YstnA42zkzjEzqhZBbLJaaMEOVPcABxjTMT1M+QSlCbM
         yAkurs2/QgczN34yNNtq4M8l4pzShqtfb5zK9ozJQGNuu4zYoXfxD420DoejQCXomaei
         G9idjbikGDt4g7A13PAhvIVJE4/YZwEgcnhNzHrYG3qypJ12pdc4lQv1TlPoIEZUByg5
         i72A0GSx+Y2QCAfPCCOpLHNKdMyi1D3y0wqBeJFXSPAjaRY31pavYRg1ZFVr0EKqnpk1
         mT6PU1S0bUKG342QUe+4/IJhH2U66WO1XfBG+pb6jkq+tvL4QXZh+P8tqX52zG0VF0tX
         fuHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUsY6S52Jf0Lt+acF+Qr8fHQq4V4/EXETZifxZKeMA+vDlde6jO
	kzqFdSVkdZKvhBTE+savLu0=
X-Google-Smtp-Source: APXvYqyMeBp1XtVAXRtIsIf3N/YX0OX2ZfW/VVXcAt3g544tuw7Gc9N3gBOsWVHkf3z9Z2Vqg2B0zw==
X-Received: by 2002:a81:12d5:: with SMTP id 204mr27427259yws.85.1556439485974;
        Sun, 28 Apr 2019 01:18:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e78c:: with SMTP id e134ls8383783ybh.12.gmail; Sun, 28
 Apr 2019 01:18:05 -0700 (PDT)
X-Received: by 2002:a25:da13:: with SMTP id n19mr3438231ybf.257.1556439485445;
        Sun, 28 Apr 2019 01:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556439485; cv=none;
        d=google.com; s=arc-20160816;
        b=afkkeJPITqDxrWlX52WJuzyzR+3Tc6X6OU8o8/8vUsK+Rfp/mZcMHdCOGPlWZRGtvu
         kzjtglzUa+lOMlDMIsACS6OkKu9qhDhtH8RJniiUDRZw+GZiVgOaJMdRCYHmDvgGRgA7
         GM7N6p8TbCId9px7syD7gTHDwjcdVzvvmJf/FKkcei/RB93aBW5axA21PlT0i/7FSGqg
         ogXezF5MSAatkPcIUuk8Xmrm1v5wuAIR9odAEp48cNpMyB7+ErBHMJOJF9MbJ8vvZsv1
         Ugui/PgbyJ2hMEbfnljbl6hbZQXQzUW4dHid40FeEW87C23es5jFWTTjCRQDlS16vZw1
         cZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=GKNjJJSVFtxlFoxlein7Zn9Hq6zDjBs05ZEXr0wSwvw=;
        b=Qe7W9aag8IxHWZYCV6aZSHnzlnhHycb6dLXLaKnrcXOR8McXTJp6/bhH5xLYVOJ6H9
         6rT3sCI+QWxAMwSvej5VEoHKJ+rIncrJn4k/N316P/AfS3rzPm1dgizN/HETrYFmVlbk
         jD6xvfbPvPvZehhSlQX7rFZiHiHjgIvwFgARH6MVn47ZYvOgnyqrj5ccDvanAmnfTuhr
         SmFZXDkLH9WeWhB9LRDk4oJwcXr4HXxREZgIJvidL8F348d4iq4sxFMpqsiDqTOcDMXH
         coZwdFBfz+EmjN/vmnGCvSBYDtfuLEfygD61tVCc0yGXEtxu7pcVCbn+x2fR5gC/chMM
         mREA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=o1LLSLgB;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id t14si260444ywc.4.2019.04.28.01.18.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 01:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Sun, 28 Apr 2019 01:18:05 -0700
From: Lokesh <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/12a40f-27ca52@github.com>
Subject: [siemens/jailhouse] a48aec: Replicate and re-license printk-core
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=o1LLSLgB;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: a48aec6267c563e1203762d13774925c6bae1adb
      https://github.com/siemens/jailhouse/commit/a48aec6267c563e1203762d13774925c6bae1adb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-10 (Wed, 10 Apr 2019)

  Changed paths:
    R hypervisor/printk-core.c
    M hypervisor/printk.c
    M inmates/lib/printk.c

  Log Message:
  -----------
  Replicate and re-license printk-core

The inmate library currently uses printk-core.c from the hypervisor in
order to implement printf-like output. While the library has been
changed in 607251b44397 to dual-licensing, this part was ignored. So, if
an inmate uses printk, it can only choose GPL as license which is not
the intention of the re-licensing.

Change this situation by forking off the printk-core into the inmate
lib, now under dual BSD 2-clause / GPL. This is possible without hassle
as all contributions to hypervisor/printk-core.c were done by me, thus
are owned by Siemens. Forking avoids that people contributing to the
hypervisor core accidentally bring in GPL-only code to this part. It
also allows to evolve printk in the inmate library beyond what is needed
for the hypervisor without bloating the latter.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f94cb9298636393aa54438642b22eefbe98a2ecf
      https://github.com/siemens/jailhouse/commit/f94cb9298636393aa54438642b22eefbe98a2ecf
  Author: Lokesh Vutla <lokeshvutla@ti.com>
  Date:   2019-04-16 (Tue, 16 Apr 2019)

  Changed paths:
    A configs/arm64/k3-am654-idk.c

  Log Message:
  -----------
  configs: k3-am654: Add root cell configuration

Add root cell configuration for TI's AM654 based idk.

Linux root cell DTS should reserve the following memory:
reg = <0x8 0xdfb00000 0x0 0x20500000>;

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5f70cf2dc70d335274cb99d585c6e3cbf6b1ee27
      https://github.com/siemens/jailhouse/commit/5f70cf2dc70d335274cb99d585c6e3cbf6b1ee27
  Author: Lokesh Vutla <lokeshvutla@ti.com>
  Date:   2019-04-16 (Tue, 16 Apr 2019)

  Changed paths:
    A configs/arm64/k3-am654-gic-demo.c
    A configs/arm64/k3-am654-uart-demo.c

  Log Message:
  -----------
  configs: inmates: k3-am654: Add gic and uart demo configurations

Add UART and GIC based demos for AM654 IDK.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dfc9bb36338a71abf61d19b4ed25a1be6574b36d
      https://github.com/siemens/jailhouse/commit/dfc9bb36338a71abf61d19b4ed25a1be6574b36d
  Author: Lokesh Vutla <lokeshvutla@ti.com>
  Date:   2019-04-16 (Tue, 16 Apr 2019)

  Changed paths:
    A configs/arm64/k3-am654-idk-linux-demo.c

  Log Message:
  -----------
  configs: inmates: k3-am654: Add linux inmate demo configuration

Add an inmate configuration file for running Linux as an inmate
on AM654 IDK.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 27ca523c074743f10516d36df624bc6aaf4ad42d
      https://github.com/siemens/jailhouse/commit/27ca523c074743f10516d36df624bc6aaf4ad42d
  Author: Lokesh Vutla <lokeshvutla@ti.com>
  Date:   2019-04-16 (Tue, 16 Apr 2019)

  Changed paths:
    A configs/arm64/dts/inmate-k3-am654-idk.dts

  Log Message:
  -----------
  configs: k3-am654: Add linux inmate demo dts

Add a demo device tree running Linux as an inmate on AM654 IDK.
Linux is assigned with 256MB RAM, 1 serial port(MCU UART0)
and ability to communicate with system firmware.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/12a40fd291c9...27ca523c0747

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
