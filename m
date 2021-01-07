Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBEUF3T7QKGQEOTPHIOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFCF2ED01F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 13:46:11 +0100 (CET)
Received: by mail-yb1-xb3a.google.com with SMTP id x64sf9961911yba.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 04:46:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610023570; cv=pass;
        d=google.com; s=arc-20160816;
        b=yQ5c5ZuThgsMMt78Trb8SCJO8eoeO+Io3vgxlYcROcEGtC6aS1uRfONisfTzTsq8Yv
         fxTIzC1WAwNXyCBQY8dRlHs5xt/TYAXcF2szMjz+TrRc0XcDkXfUIE83FA5pn0/iddtw
         30yLv83XUQWO9c+wUrGf48KXMnX3qL74N9acFTr1gfnynI5edGeXFKQiguuSnngXRcA1
         /77OfgUQIo/U/WWoIt1sp1kBQ5QQOyWGpiitRLq3gYQyYyBsyxqGOAysEAZebjpCoDiM
         eviWhUVkwWcKUtiT2QTCii1sKuLIjuJHGuttxy+pAS0/zjCXDeeu6ClBMHWMhxA3rRmB
         4SLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=F4r8E4aJm+JDjPZPAwC9+SNQV3WZvgaZyjz7dAf761E=;
        b=zK6bYzQGNd8aKS+g71GkUsaGnv6aasR41jKF+otswZxRhTmLIl06s2gWBb6tQgjpkT
         YY7+22mHlLNhzqnqmexpGQkqVtiboyXcP8oifimTmFkE+Lx18pqSlzbr9TTf1tMfpfzy
         kRQkwj7J6yoyJJsqlHrcC7PzPi5FAQmQuBkgPFY1asoAOJ1FXyJ5q6u9UgCBk+J2E6a5
         37LpALnESBa0qET3bRb+ShGRxWw7yMzgCT6BuxLJ9/FPiku+9EjZYgFkYZKfQF/U7vFv
         iRPs/EnYy5NxSkAaQmlttpZ/25L53cvBwq5PIWTNJxnZpBesFX7azIQnLXJSPU429MTW
         z7Rg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=wODzKMuu;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=F4r8E4aJm+JDjPZPAwC9+SNQV3WZvgaZyjz7dAf761E=;
        b=POxACHbKLI5ItjSZ/W6ekuWLsVRGoKKnSPQWK38rDkN7TBOlkBTLTly8+QwL9Xj41f
         sB1jA4SKQsOEILaL3mPT9VPLzid/WlJ64i1CHAPiYwFUOWONdvoU5YJd/Glju0OARx+t
         qLvBlHUMc5weq5KQps78Xrn65nIN7+7axouW9mgwZTP6+1JPKdoy026Pl6if/A0DOBKf
         +g4wpxYL1dDSorgagbbQEDbEVqqxHfQGo5Z+QUg+Lp0Rvf2DfAL5bwE0aFkp/cBXNmsM
         p/d5rR4oUPX3Rx7cteibVNMlxQBR9yb9RCyg9+BN4ikp7hF1lMsJc0zNU2uK5tSvsrk6
         Pmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=F4r8E4aJm+JDjPZPAwC9+SNQV3WZvgaZyjz7dAf761E=;
        b=GNBUnpZlKSjwxp8L7tn9n9TY3GkXwZqy4fxjrU7+tumhFOndS0r7UoiidCot90KJGO
         ebOpcuYAFcUNpYGCfwEl1pTqBxr7L4BAx4SsMzj0HFNb2eT9qnNkwiF6TCV3ehbkRbm7
         k+VjaM0Xc1wqheAo74QSdiASNKVm1g/Lup7heKW/38a1mezI42ckkM1RRMpUNCLlJMbz
         5ISi9pdzUyZgTrlGdFeXPhgJPURfxKlPcQuG+CgEkKZP9gmS9U0vJYYzDq6VFRfM5yvL
         pnkvK2Iw9rfXE+Lei1kr/phjC2a7LWkO41WbbH74JO+PoBAEFVu3e3Fsa4LgGheKqZLl
         a7dQ==
X-Gm-Message-State: AOAM530SNozkgDNtqlygYZTwZjii7I62ltOzDN4LTCnbsqPZIvTL0VEw
	5Nk72yD+7DZwN7Q3OpyQXR4=
X-Google-Smtp-Source: ABdhPJzhXxVO0rPsiiwr89L5f2qQEjz59dtXruuFuBYhNOm7T/NmcA8SGVWJ9rZadeYMZjM7c2OVtg==
X-Received: by 2002:a25:8141:: with SMTP id j1mr13064900ybm.467.1610023570536;
        Thu, 07 Jan 2021 04:46:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:946:: with SMTP id u6ls3690835ybm.1.gmail; Thu, 07 Jan
 2021 04:46:10 -0800 (PST)
X-Received: by 2002:a25:c802:: with SMTP id y2mr12192558ybf.364.1610023570038;
        Thu, 07 Jan 2021 04:46:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610023570; cv=none;
        d=google.com; s=arc-20160816;
        b=LjJwrZ6Vo1/Z1V5Xg/MaFbUc1wPsOF+kRUnx9hBbBZRcXJpB92h8XaYZOLf/lOSD0M
         oEEA1KXVVXvl/KNEO08DGyZ4UVbhjCLpJKsb5gS6LhJSbLJyyfIq1oqBA2zrP0tEuPsQ
         e0q5wtCBFNNekmcrCCdoFw9uhrzF1ilatOEc+KIWnx2F8zk/sBZrDss35StXtgDXFavI
         iI4qvvu7vyET6hjvgHaCv/i/MtHGcgIZFNT+4DdvSeTzYwynA+ahS2T6sJ8aQRWwVc22
         sSrX6c28tUyvZruzhqa3sBb/pjOVEJsI/G5arh+G13XWWG9dLr971KtUJRWIHQVvnqBd
         VNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=WWuS9Qkz+7tevO1C+T7nhCBPcLO2Y2O0iGl11Z0ZflEZvtC1JviIwXBKhveo0jk+hd
         sA8GdzXdb48e0mWGV4zPEnqMeoX74PiaIx8ZiwIH3eJjoNGgYbsijRlEGqfSvG1gVXx6
         HiErSEgNXjkkpDxfiAf1zB2xkdsTlSTszvs7gy1DXW+lf8xA7w83SO29V3UexRyml0yS
         obIrbGSa11DxbOpHJm/zCVKTgepAs9ukY7I7b69/2fmLOkSgNe8WPcL3RdU4JOyjMdYN
         w6qzMuyvHnOkleQavaE0NqiHH6W9MQsyKA9SITVpMB/a7FXh8KAB8DQEACH6UzWjvamK
         oSLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=wODzKMuu;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-27.smtp.github.com (out-27.smtp.github.com. [192.30.252.210])
        by gmr-mx.google.com with ESMTPS id 23si609513ybc.0.2021.01.07.04.46.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 04:46:10 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) client-ip=192.30.252.210;
Received: from github.com (hubbernetes-node-aa3de91.ash1-iad.github.net [10.56.110.73])
	by smtp.github.com (Postfix) with ESMTPA id BED92900032
	for <jailhouse-dev@googlegroups.com>; Thu,  7 Jan 2021 04:46:09 -0800 (PST)
Date: Thu, 07 Jan 2021 04:46:09 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/b93e97-b91751@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=wODzKMuu;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.210 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/b93e97-b91751%40github.com.
