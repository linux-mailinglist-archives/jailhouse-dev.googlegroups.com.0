Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMWRXPYQKGQES37BY4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3b.google.com (mail-vk1-xa3b.google.com [IPv6:2607:f8b0:4864:20::a3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F70E14A549
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:42:12 +0100 (CET)
Received: by mail-vk1-xa3b.google.com with SMTP id k16sf4451975vko.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:42:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132531; cv=pass;
        d=google.com; s=arc-20160816;
        b=vqPwR7TLhfq3e9PK5lxJhsMna7vX1q8Mew4FZzUxqZFqxOTm9J8vZt9QLj/c3xIpNr
         w3DWpobBORtlAxcGhawohhRi3aDgFPbVziLk0R2VnSWiivLJ2TOheGqHOOf064pVq1Lb
         7vCDwPepFK11Uq5l8ckiLpDxwoFUtWirn4Ao26IDsGFV+Ry/VafOCDNRGBfo1F60BPp/
         Vj+N1z33nZ+5/eycpYLnSn9EBMPQ5pJ0DfOTNSVrZMANkBxWKDhZbwbbn7Fd6ESgBWM5
         CeQlqr0DoSgodB0SYKRiqo2rbCk34JgUlrS/MDi48gkUy1unWU+/MuVHZfgOCbpsHlJM
         T66g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=KCZcRPlDAchRSEGB63JhfDk8Hb0QkMudQMMGhT3+u0I=;
        b=Mbt3KguHXJX1murjVM0IijYwU4xHwdAakLdp23azQ/RN1bfyMSqibgfUXfnhX61r02
         2TXokakZXEWtg0NdNJF7ZGgEaapubiW1juFb0pSNyVLPQbXKFLNgAXk3s4EOsAxl8pG/
         mQhq/SckIR1AItFPEy8CXhBF1sUP0uPjnaETDytduoMZQaeCCVLqfY+njtQGSaoXLQ28
         x7U0Y0Tw1cQgVss+XaaUpjmppGF35yB7Wj08fyYXEmzjxcsPT0lO2S7WcGDL/ohoYbib
         r/+s1cq9X4W8Vufku9oc/+1/46DMsnz+8MxwmCEuZkaiSqiXTISgkAa6AKWFq9NK1/aB
         vjYQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=GyQSIs75;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KCZcRPlDAchRSEGB63JhfDk8Hb0QkMudQMMGhT3+u0I=;
        b=ZavFTiNRSOl6OLEhPegNDpcuF3ds6lETqrYdWahm+2oFZ5SgLeyAKTcNvtF4BJY7hD
         DHNzn1zTKCJDxR6n4HYeirR4ML/x9oTwYmlefphbygg31l+cFBNiCjztUOvCRLRI/pa8
         90lwetqi2h19rQ6VkrsLaIZb4cPavtGb4WqC7AidZ3bnFCJGqZA/QCU4r2EQHMxLAyhI
         QAb9WICSHhakFTQg755Jpu4l0RssJX7JCE5xMvrQLp1IDmm1lpnQZaANUJDp5IRcx98B
         L5aA66HH5wHKLrYudQAego1u7TY2/l1zAtaSj8QBgGd0CELgUNpbpasDL09RjXRMbtKo
         4ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KCZcRPlDAchRSEGB63JhfDk8Hb0QkMudQMMGhT3+u0I=;
        b=n/G91PNZ63JZfyq88jUqqx5IntQSMb+C2ny7kaTtbg+bDiKDyCjI8t7vHb+dSdhy51
         IjwbSrQyREF8N1pt+IS64uLiV0TDHg85pUraDzsiTyqkYfxthFU8fvL8HVY0iHNSfhj6
         oYC+kHukd+LXc/hjQ3UpNRBRxATEe+xuYG0IxpG3n3M9nBDJTBkwRqTdz8VW2LVVkCN8
         B9888UMwP6nHfDF0MGJ4Djx4vxDFXt2qKeYaWJzYlWHyB+dF/haFt/EvWQc7bSo4dtm4
         EMFs2QNZI8KbHvv2pRRhVny0y4xyON38rq75o4HJxTOJlv5Qh4Qxjdz9etRhqwJNRlFk
         mtJw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX5k4tphEyOW2J1dnVQqfFDwiNSSLEq5edK4lQoMgdfKteIF9Z1
	rvUjPmvE7bMa/m5TjU02Mvo=
X-Google-Smtp-Source: APXvYqyic2ptSGovsqUTDR9eCygW/SU/BWzlfjDaB/3Cyf+LwsFmdnZQYvuJZU9CqdgwHMgqNzInTA==
X-Received: by 2002:ac5:c807:: with SMTP id y7mr3544287vkl.92.1580132531190;
        Mon, 27 Jan 2020 05:42:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9f:2883:: with SMTP id d3ls603623uad.6.gmail; Mon, 27 Jan
 2020 05:42:10 -0800 (PST)
X-Received: by 2002:ab0:618a:: with SMTP id h10mr10020762uan.53.1580132530605;
        Mon, 27 Jan 2020 05:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132530; cv=none;
        d=google.com; s=arc-20160816;
        b=qX5+KfzXIJaCj2blzCJ1A6zn81VGguci6iKW2e3rQrVKAxozqrMx6KYZ9jKabK56dh
         jm1Oegza3Wx7PX8KTU3JyDQMBd11f8Se2DGADgK2Fe/mBgR+ltDkl3RaPuasf6QxDRwY
         qvYdrbCGMUjQ8el7EzfIXvN951NW2A8cfuGr72F3ymOpnOd7MuAAiL5gQqysPWm+ebiI
         SweAJJeWmOb3YzI2e6R2Rfuijwb3bcIvYotDsbEx5GssYpr436cWeb0IR9EMVyaisqnM
         H5SUqwP671KdRJ9eZ0qu28ZPg3l6Rb/YMu6pj0VqhwQ6NoFnGdSB6CQiOb847O84pB+h
         qtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=BAgG8oYdx4Q1vVlbSa2lOmCMNyGfjrosE7PKmtxWj/HdnI1E8q7Ho/XBZOvbCpGF7J
         i8o4rIhT3Na51b/YlMxYi8yzSeDlV2QMGqZzR6sEQNGYAgYTBLENxI5jw4aO/RaGlu4C
         BT1aamrEFZeVZj43KkdRI08vjsGzOvc+8FhwTqCqBLPCyQCndKwwv1jjaOgnuOe36Cre
         MlzNY6AxgC/+q/BKwwdFpKwD4PjEJoX/finghhwNyMjhzyGjnwZItRrEWWkg0/EHL8gS
         v3v7r7E8/pQTeIvsIoRa1Is9+finYVf2dvR1AYIe0Wg2vpWT2lPjeXPyPHH8R82+v68L
         f4Sw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=GyQSIs75;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id i27si747252uat.1.2020.01.27.05.42.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:42:10 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Date: Mon, 27 Jan 2020 05:42:10 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/5ea603-2c8fc1@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=GyQSIs75;       spf=pass
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/5ea603-2c8fc1%40github.com.
