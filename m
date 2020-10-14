Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBD56TT6AKGQENNQAZMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3a.google.com (mail-vk1-xa3a.google.com [IPv6:2607:f8b0:4864:20::a3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E30F28E39E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 17:53:52 +0200 (CEST)
Received: by mail-vk1-xa3a.google.com with SMTP id m129sf19489vkm.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 08:53:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602690831; cv=pass;
        d=google.com; s=arc-20160816;
        b=xZV8ObsGEyp9BNKdydamnr+kNZVZblAV1wXXkybAfSAHbGcGfxZ/sACQ/jXLnCA1ve
         TOh3/ndsBWFIGBLFt7FJ+TjjmYvPZ0QtMsmdfYghFuI1SwRq+6rFMQ2xU3trBgWZBcIh
         HJTyo9pClY8iRrKgMuA9B6RkdC331WgUgveIfgwzNSsnBhoi6apZ+UV2qFc3yUaB6i6A
         Qvn6AiDDwEVR6Pw8UpOXREjmATbNJX2H48TRFKpcdkMIJzMJYrMfMR8faBQ38oIPucqT
         mw4pbCCIcep1Bvy+YrfpcxaNIs0jPC3LEw7n7EV911OhtJ5uztb9KkTBDHGBl+VcEiya
         lzKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=v5UavPGEvgCSGrWQU9hzlhBwMHcE6mfKry6DPGmEgGk=;
        b=ozv8cxq3HKz5T1ylaf6RabOGaEOms59DF5CuTTpFZEyhdE16Oj5mi+3xgs+RPSROHb
         C25VkfsrPEhkqw+Xb6gHE/RYn/IerDqyOB6pV7AqtD++F720oFxHVWfpbSDFw+gVfIKM
         Y714MyVnHJfbFADcBZo0os83eXkiOxsRncNiM0aqpoEWp/2Dl0VCyyLPTcOMRWMGCrmb
         OtVDqQ0zKhkwODJD80O2UibGTEfCwiqQmoHsdQsbnZRZAoxDT9v7vxW3byxmU/VveCve
         Qm3cwlQOVy1tJ04KaRb/BNzJazlvsCQUasNQB+Eap4+f06SxEEqFM9D+gAtHECrMKOZF
         yvHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Os1X71LO;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=v5UavPGEvgCSGrWQU9hzlhBwMHcE6mfKry6DPGmEgGk=;
        b=P0yi5XW7nwvCKUO+opfXxrGKnfJnuL1gRRKqcnyw94FyNsMbcUim8o3Sf6ukv1lGac
         BoAXsw2w4xeMjpa1+wbrxUVGnHqIvs+GiL5DI7/vyneZMRYs5TQcZIVCDtMXGUt94fdI
         T/0H9cY22jGGn9KJ2QrU5gvHbEzIKr96SoKl29I3eyonb0JRNOJz9ICZ4tlXLgjMC0uP
         eHa94CT4Bnlz5/6kFDfUha422/ktyHkAdlPu5oBOpdeUkBHRwzBf8kTxC1vs8HBU16W/
         AAeLSI/6an6+hCzTkTPBVQvNIxDJjQJLYjT58Bp8pURTKg9FNY8mCNjIfUxl2yL7dxB/
         UBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v5UavPGEvgCSGrWQU9hzlhBwMHcE6mfKry6DPGmEgGk=;
        b=mBpqZWFepPirIdafrVrb7qKllhIoQ5t54H/zfj0hn/ml03YhdAol0KORXS4HHLJpa1
         7YzW1dMeHYOTpiKpUD5AExx8pEcYwN6sKS79wtPiuiB7JPFkt5nPa6gxSusZmjuthBjO
         Tp6oyeyzG8O+PKNc4my8YxT2qJZxcuLJ3qTDVTs7tLacwOvz40uOjdn2cWd5e6jLiw0Z
         9160x2C0Ru+npzsTROB94FCEm/h1+RK70h/+uAlsHN65ilLFv51Zy2ldBVQ0Pgal8o2R
         IzAcGJ0ZP0Oa7/skKQdsUffVZnLO9gqPtY+NXK/sKm7LJtvMyCO/eV1t99jgL9CyYiH3
         5tJQ==
X-Gm-Message-State: AOAM5313yEgjRfNo85+aQCMvgMFRVknhKSmKqUIJkZvH+MNpgeS/Mc4F
	cpdfnqc1wn0607QtnRz4NsY=
X-Google-Smtp-Source: ABdhPJw7aps+14j4W380dr3Zdu0n3RoQuZUJhUOazz9B8puka6OUbQe6nm61RbpDEV3S1UsOFr9IAQ==
X-Received: by 2002:a1f:9c12:: with SMTP id f18mr3422633vke.14.1602690831379;
        Wed, 14 Oct 2020 08:53:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:fe04:: with SMTP id l4ls536692vsr.10.gmail; Wed, 14 Oct
 2020 08:53:50 -0700 (PDT)
X-Received: by 2002:a67:edcb:: with SMTP id e11mr3993264vsp.11.1602690830639;
        Wed, 14 Oct 2020 08:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602690830; cv=none;
        d=google.com; s=arc-20160816;
        b=w5X8/b9cHTXR81KLMeGZhNRvdjzlK/QGLA2gWcPMtqm5Rsz7JwAgBUABIlCK0Wivjv
         06VDHER09Upi1cSwrfWgwU7VywVaBrPPIFVdZ1mmdtDBBqXutQ9yd1J/GfJW4djk5juY
         IHi9zYEBiEilWi+R1VbvcbCe6sOwsf+tW/EPpQA2L1orLpPQ6qvbF3hXcVhezdqEZL26
         b533HGeo+nYFjoSP+4BNJcbM6TWVq0Mbw9VbEDWBgltSSpbDGNOSWMK79sMlneCeFgTc
         NfBgUGuTc5oX9N9QqlEejn6uqcFUDTxJk5FcLmSxlWKmXXXEcpzgh3NmXNxWP7HCPYka
         dcOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Q3pLrb47DJ9P98BzdMX3Ln2wJpH/3pxEYe2QHz3tN9g=;
        b=ah32szKsQjsaIof6pPuDpeYSsfWgVVSE14UNgpqrfj8N+N8+oLBcGLDWzyy2vQM0u5
         h/utqfpZR2N8IovuYLOkbgskMsU/+FDy7Z08QbNpduE3DM1aXkYLs7TQJhFyNJZ5rlpR
         Yn45pyWbSBaFmawZP27JgK2jRmMC3+9SguWz6/OVv2F4h6nhGRwfXzmZSVLySZ6Pmfnm
         BSJpa7QbeWDleToc0fkvJTyjizDsIa1/HzGJj8+d1HtpE2rpQe8hcJM4d6HWWer4zFwH
         bZPHTV5MlWXaFVLz3KCWknHxPiWui68G+meZx9Y9EKEW3r91X60WhvrKw7M+LGfuY8hG
         Ynng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Os1X71LO;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id w123si182572vke.3.2020.10.14.08.53.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Oct 2020 08:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github.com (hubbernetes-node-eafc193.ac4-iad.github.net [10.52.121.42])
	by smtp.github.com (Postfix) with ESMTPA id 4DFD9600DAA
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 08:53:50 -0700 (PDT)
Date: Wed, 14 Oct 2020 08:53:50 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/e3c512-1f6e13@github.com>
Subject: [siemens/jailhouse] 1f6e13: tools: Fix naming of tool in Makefile
 error
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Os1X71LO;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 1f6e13b686630e6162d894942aabf2bb7845cb85
      https://github.com/siemens/jailhouse/commit/1f6e13b686630e6162d894942aabf2bb7845cb85
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-14 (Wed, 14 Oct 2020)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools: Fix naming of tool in Makefile error

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/e3c512-1f6e13%40github.com.
