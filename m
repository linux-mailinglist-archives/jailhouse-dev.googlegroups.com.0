Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBK4K2XYQKGQEM2K7BPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9F614F75E
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 Feb 2020 10:30:21 +0100 (CET)
Received: by mail-ot1-x337.google.com with SMTP id 39sf870017otb.8
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 Feb 2020 01:30:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580549419; cv=pass;
        d=google.com; s=arc-20160816;
        b=keHvOsGs/Z3HJOA7VHovPX3dZGXCaIB1KnIsLl/Bew4nu34VOK9tn2WnJjW/77mvm4
         loFZCGZ0YfEIp4Z6xMYh0jqK0+tjqmU5YzmhOPv8PjELG2k3bwbiCwIlwjwiFwnoeoY9
         I0+bO4w0V9ciH+1CxAKrbgxJjOZVvXx5dQ2Xdvx+AnITK6TIE2UgwMbljRxnL2Eb+YR+
         AyP4mfgEcjh1wjQ7QhlXSShmgxrCNu/NufZ9DjU5IdXhy/8wF5TpXJQQRK7+K+BptHpu
         ioYJADaM/1Rj4h5VXCZuw9+rOhOPh6OLtFA0b4L/WXrsjEkmL5GoKyyex+ipfgOHa9eR
         PM0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=qHzvsq/+FmDa+8Rx03JYYRUuCewjiQCNf+4URQDnAgY=;
        b=trK0jTBvXdB/8uDdhyiyOSQHrDIyDnzlFaRAbq0T72/V5R4yCiRMZO2LCPHX9prbIO
         FnxmzrQZq4nHNXf0r825VohJHJT7/dqbRGtEaAjziHgkkV/RbV65ID7l/OQJnLkVXKmn
         aQX1p3+KdGworp2Uk+wyQYO3fzCu2chMuwzdvHbaLxfgSjuRTAOr5ujt1AKEyMEUV6qR
         v5yFpyxh2oS2EA0xn63xfFtWHpP72l+vYxQqUSXMX5vBXHIyzJqrdpUtigX8svjeBtWZ
         ZyikPDRinLt71AQrFZb5zXUIAsYmWdvcWT88HDaxVd7RM+dcglgTHJ0nHBG0HtE8KhMr
         nwGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ErVjHwJd;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qHzvsq/+FmDa+8Rx03JYYRUuCewjiQCNf+4URQDnAgY=;
        b=TEKqbSXSGmY2EmvAKWrw6JYEA7FLhYBBMDHUzAxpJuiUoDC+FuCZFmN+AkLoyZ8Hoa
         W21XiRxngzN0OEbKa14xZfR18e4TokT+mypHxZQF39C6+20gCaW766te6YNf+Y3uX1qQ
         hm2r4XAMnQoRDsUMEgOE1Mz3aFwI112DHuqZE+K8Ifqs2V/YcAlijHUMy83ebXSGk6eM
         Ejl3VFIalI3AndC+ezn+fZ+Ud1QqdyY5Fh0oMYSF2laBXTkKDli1sHb6/AUlwQI4tZW6
         qD6A5naWKAaBsWC++OzpQM1BWf71VMkMTXt859fQIWuvT7PwoLDtqQ4GLZRAxLaI9kQk
         vwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qHzvsq/+FmDa+8Rx03JYYRUuCewjiQCNf+4URQDnAgY=;
        b=frI0Mnz/UDsAITSe+Om51UgA9zOpkrUltnHQLQ+PnGB8eK3dhXsF9/BqAuvT5tUu+0
         ANNNgPhSDnFq36MFey2XOo37NDI7gAXg0m1V/5jG18sqHQK5arE2mrfiHcjLL4Z7GAn6
         kND5ABJvOAx72zxiw9WQkF7ZldWz5xA65+8Xp8cUtM7Y2+kYbEpYDhK4vgI1Lf05Zbd3
         Oc047MbgqxOmIC7d0IwpvMuHmPXit+JB9IkKZk5kgw1OiR1eRwmAQNVs3q/zfJ4ASnyz
         PSjqh9b2Oe+ONIpcR3kC/A3NpK8F5RVbwJg6Q8CQZE0ByNe/mWITWpknDnzPet7Scp4e
         054w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX2rdIE+e9xSiKRcPmYzreYRNe6tmtyJw+CjPqwsEwvyHxMejtM
	O2+t3fPOZrsFUSwMlo73NW4=
X-Google-Smtp-Source: APXvYqzoBWQVN67Xr9Aw44tWkwCrw6dcLGoLv88Mn6GzMUs2h4qyHQbpaDqTZd0fOfQ/SIpod0t/zw==
X-Received: by 2002:aca:f44a:: with SMTP id s71mr9021676oih.7.1580549419570;
        Sat, 01 Feb 2020 01:30:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7dd6:: with SMTP id k22ls1130547otn.5.gmail; Sat, 01 Feb
 2020 01:30:18 -0800 (PST)
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr10836552otl.72.1580549418123;
        Sat, 01 Feb 2020 01:30:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580549418; cv=none;
        d=google.com; s=arc-20160816;
        b=mD2HWG5hBVFaif0VzdY3aoGXAEe64QFGOmWdlislwg+aVM0+iVxHHbhHb2g4MPClS+
         Gx6RJFOMKE1LuvJJtdfbpskUv5QKJUAe64vlvRFnQB+cYJzCFl4IU0gnACTmwzdQWxKr
         skNDUfZYAbyzrXwLDTNrIou1gOZXnWqVY9vd7vx/JIu/vE1kerdOFQRblhTsT7F8842y
         bOLOIrYYVY49kK2+MzCY0BDWwnoOvpiRIlHDimkkbu1sLGdr3ItiPPZgt4b1mwraL1wx
         3SofdEIP69j0t1F9BXxKscpuADKYBiInExVXar3GNGc/+vUcX9IKUBYZ1KgHGGuJNM6y
         h/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=M5Oiw3BXdYxZxTf9RZyzJT26epVcPJTH/Z0vhoDySak=;
        b=R6MTfeQmm7QlRUR8Ch0AYsyXcC/Xukn1pkETF4Nt4KASfI2k2h/pq6G2wZdMi1aNNX
         jisV12L/2gBJonLoYmBpxAuoOan8+gwcq8T8llTQC6PV0J9XMmFhcLaWY1oC4mVp/iTk
         0ehTUBn8jR+S+3l3FjFE913vNYjMXAbfd5tOIgwH5sPWHPc5K8f1fVgYThf0fq9N+qhn
         itf/DDaDUJ8fMtExTfUvgAez+IKiJsYwMz2jzLrzQUlzPyPg6Frx+ccTOJv+3mEkiklR
         RSsptKUwPTh3ZHs5JlGIYkfCMEFD0PkIakIyXOCu3x3G67KtlUec7174Pcm5a1P9jq3q
         cd+A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ErVjHwJd;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id t18si662642otq.5.2020.02.01.01.30.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Feb 2020 01:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Received: from github-lowworker-45eca55.ac4-iad.github.net (github-lowworker-45eca55.ac4-iad.github.net [10.52.25.70])
	by smtp.github.com (Postfix) with ESMTP id A0AC91C0948
	for <jailhouse-dev@googlegroups.com>; Sat,  1 Feb 2020 01:30:16 -0800 (PST)
Date: Sat, 01 Feb 2020 01:30:16 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/3814e3-213747@github.com>
Subject: [siemens/jailhouse] 213747: configs: arm64: Fix comments in
 qemu-arm64
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=ErVjHwJd;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.193 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 2137473830c3788f3fbca9f1e782b2dcd7c358d5
      https://github.com/siemens/jailhouse/commit/2137473830c3788f3fbca9f1e782b2dcd7c358d5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-30 (Thu, 30 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Fix comments in qemu-arm64

The device tree remark was copy&pasted, we use mem= for QEMU.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/3814e3-213747%40github.com.
