Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWMH43YQKGQEIUTKABA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd39.google.com (mail-io1-xd39.google.com [IPv6:2607:f8b0:4864:20::d39])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0AF151C7F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 15:46:50 +0100 (CET)
Received: by mail-io1-xd39.google.com with SMTP id n26sf11925304ioj.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 06:46:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580827609; cv=pass;
        d=google.com; s=arc-20160816;
        b=JtcqiKszdrK4eOBUH0gSe2Pjp6JumcdVhs9m4AU2M6mAo525Hv/F7QJPlbLAzs98TM
         YF0h+/fa9pse+DvWstYcndexjsJ2kgQsT5uONEDe2tChE7WKtVz37/ZcMrWHjvuQII3i
         f3Pz538dkqMfUE7FGTqcVkKUdXVWAOvKm0F6PzIJfV8qCh/AJ4wxUSV7jTH0D5I8TQYE
         A9MrxaWo6vOg6LQklvTlSt7CAi1U/mN9WVsMdiuJjmUtNMtwDD47hlxOQi75Q1mPUtQa
         Ku2erWOWBzQndswfi0PZeRyD0G7fED79Jjc2t7JlpE56BmSYNKS4kgEuFLVBX/kk+I7v
         IPlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=iuwhXrOKvlizqRaG7w8WZ8ftoSFvY/p7lojtkrUESnQ=;
        b=yICgtqWNHSAVfvXA9rXC27mgFBzoh9lErOiDoJ1uGxkNmgckRknDsH0bKLh4k/mnYF
         d3tZKaupyXAt/L31En/aOeGOih09WBfzyt8k3RvYPrFTeL4TIiwbnmlWnrHnsPOleyrU
         pNVjc1F6JquKi1WN2TL/oGE/RYB1Fq2fykkCls+rleSOQKzcWvItA1KvvDyDauqurpw5
         reBIxVnSC1hdbejzCEZiOBL1ia4P+2DAMRZMpshHHpUDcNM4ARy8o3hwYe9t5It/M/UH
         Gg419fanQuvEh6ds5s5bsBf6W72p4HLCaY/9yF1b9II3yHVk9f0bxbmCyMFYbxgpWAiz
         CZog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="ChdcwV0/";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iuwhXrOKvlizqRaG7w8WZ8ftoSFvY/p7lojtkrUESnQ=;
        b=GRDdSkaeQWYaDkMPQWo4gl8AiywZcC4jNedKbtrlYn4O3Kll6o6T1bRBc5tvXHrPjW
         ZvsXCI6EY1lgz5L4sBEx1nTzfrm3b+e54+25CMUxUp/dF4cN+pJaIt9ZIwogZ68Ya8It
         v0hHQxzhD8Drl1hy048puWYdzkSSbe09mBqH5mEXPrYzdTUSR4z+zTxseSL7DGYed7bB
         v6bm7ijfSwFCntzUcaKnkvRPrDJCVa0FDtPaS54tvMcySSZC2JoMWJthHRZocHEiAgIP
         az16OFB4ecSxcGYkPqD2g57SOC14qnMHPbPHkxxLXhGgTJG0djGWr1CbfHdcQC9oV4ZB
         Jh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iuwhXrOKvlizqRaG7w8WZ8ftoSFvY/p7lojtkrUESnQ=;
        b=k4TxwF3jEBHO4QFRf/DvfRpgrgBYy7cCyoKlO7BoSR11KxTlD7Qon835vUVCyXQ/+W
         EvmON5CpIqQdVVm6KB8WGJFEopu0y8fy4dja/vyBEOLfEGyI8Xx+9l97heR2gyUCZMe0
         tv3PCAbdGiQ+p3vXj8HLGeiA8Wm1RwA+N5Y6Q4JAuhexZ/gi8wgb+KrxP+L2/jLRYMEE
         PudgSc8PEfve/2+6FBIAgROjrPs8WRJmOcEhEEGDGXy3DtVU7ZqNoqyABEOZ6QXXoBEm
         FX5syBc9jq5O08LXdYsjejJvcXQMG92K0ygwHIThN9AwAYFEHWR9re6HpbbYlxOfqcoJ
         BWGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUPTUSm6shJ5yKc0kcDK/BTELFcwoCawYM+pDxCeD+zTEvB0lgP
	4hFb8xTIKpjRLBpJFoLu5Yg=
X-Google-Smtp-Source: APXvYqzsKimNw1O94WX6xYmwCVYc0F0Mn6F6zAdLQ1+8bkenZbbqHFkDOMD3kANe8xnjEDaOwaC2TQ==
X-Received: by 2002:a5d:9c05:: with SMTP id 5mr22099721ioe.18.1580827609474;
        Tue, 04 Feb 2020 06:46:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:5e84:: with SMTP id h126ls341142jab.5.gmail; Tue, 04 Feb
 2020 06:46:48 -0800 (PST)
X-Received: by 2002:a02:cf2e:: with SMTP id s14mr23747235jar.124.1580827608843;
        Tue, 04 Feb 2020 06:46:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580827608; cv=none;
        d=google.com; s=arc-20160816;
        b=o8PoTcDM23GpMUjdBjzlmrzhP4UMoqvvY8N5zsAjd8VsuUIrTKUQ97ROdAdvSAixFT
         nc0dZKHkJEvgGJGvcebA3hNJW9isPbkjEjBZC8b9UA5fsLk76Lhn/ReLM+Y1xN6W+gyb
         g5L1iasuC8yhTOr5Evu+I2u+jw3GMiT0eDkYJEM9Nmmw4VNlDoKoVRBtwrRNizWSLcVo
         GzRgPfxt/qI7EaZhzFfIWq9lujHunJAv3RPmKPp0BGENK46qc8xnXjSBOerUl1EfjjbM
         TtYb1mUMnOkU9/lXkuwgQgbbtInaQtO5HSyOzKObfQWOUY55WKhnpcwCwWZPvNJZ9W0S
         Nulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=unh/RjgHkHfjPPhq7A89om18C7cqSF9fRrerzwMlkWQ=;
        b=LltrM1jBmuzknTOA3o3NAf+8jXs1IOKzW6kBKgkrBJGwydFrVLe2oUiD66v6X59uIl
         nIfGwK0b/fUpxYSBJvFD/WygYlQM5BkMbMhnnzIp0D+Wr20oB0T0FNlN79F0sp2XGYwv
         a8v9h8dwUeEYYwFaZVPWRYz7yvYya3NsnOwxF+vuDC1WGp62glakGkOaakoA05Z2eRkL
         rq/UohDLZWd108WCrAEaFbfrWXE7LC1AwCaYaFBPCezCstzBHPpVJDDsuMshZYEf8pZR
         vZqouup2LisBeqqax3Tcfhs3HHoI4YJwjjG8uUSXOi/ve21uXyk/MqTA2DKzoFMOJkSJ
         Y/eA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="ChdcwV0/";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id p9si270291iog.5.2020.02.04.06.46.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 06:46:48 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-6349a71.ac4-iad.github.net (github-lowworker-6349a71.ac4-iad.github.net [10.52.18.20])
	by smtp.github.com (Postfix) with ESMTP id 6018966043F
	for <jailhouse-dev@googlegroups.com>; Tue,  4 Feb 2020 06:46:48 -0800 (PST)
Date: Tue, 04 Feb 2020 06:46:48 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/tags/v0.12/000000-9afc96@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="ChdcwV0/";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/tags/v0.12
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/tags/v0.12/000000-9afc96%40github.com.
