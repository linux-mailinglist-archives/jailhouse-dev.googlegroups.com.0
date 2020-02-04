Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWMH43YQKGQEIUTKABA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3c.google.com (mail-yw1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03E151C7E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 15:46:50 +0100 (CET)
Received: by mail-yw1-xc3c.google.com with SMTP id i70sf26729078ywe.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 06:46:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580827609; cv=pass;
        d=google.com; s=arc-20160816;
        b=Uo1kmKhIvdte0r18NlnYAVmqPskgK7qrN8S/PrEWgbX9TFpH/nCwZitlJqlCttva0q
         LWCdIJhMP+039YA6hmQOxSKhGSEo8M2fLAi1hcIySSoYQW3LDU1sHfeIgAtXtRCTxzpI
         M/SjxBBgnb0PGpaL6Lhu4GLsK0+WDVptbaBbH3P4hDwfqJBiHrZdRlhQ+oVPmQ9+3lXl
         bRKCv1U9hI6enpxFw/8iez19cYzpzqbvPwzymD0DooRVqmnarschDfFy2ljlxt754FTW
         VT7eKwbiIRDzbgDMyEQEUuv/cRo8+hg4F0nUdixMy+vNltPnLX68caPc70kOBJoqQarq
         hlGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=RBalMPDlPfU7x7Uah26de2B+60YCynj5e4eSQOwO8mU=;
        b=OhPndWASrW9/X5h5os371QEkDIzvUFReHPCPz+W2ir0i4b+0WM8Wzm5ExSCeS8dRJa
         URSrpNF6KX7XIXuiS1HRhkp/izg0sT929hP6U1jQjiwv/6rMI91GetNYMch8NonGv4o/
         O3TDzRqADDLC8ROcg2YSl7zYPSf8L6IpGNnyh2PwtySOrFvcnHz1j/WlU4kN2xLweziu
         YOdbGespOuUo1F99ZZNCBVM4omgj1TxUr7113faGR2SnZxpc6HUoB03GMPRF+7xy19OC
         MhtrA3c6l55hJcGw8ffGXYvT2F5P5Q4gpY/Q9XKAdEC0znFmRlC2oojOVXb2cw6Tu+ZC
         41Rg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0Hp9uljC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RBalMPDlPfU7x7Uah26de2B+60YCynj5e4eSQOwO8mU=;
        b=lrTcqKez6ykcjg0kNm1HxY8oFaVe5Rm3k9LA2VX91GPVNVL6tOHb1NtYkslfA42ea5
         RErMjWVL2cqvrglUfdhgp7a+hVwwJi991ZAbd7VrxAfun253FmEq2SqsVvp+mgixg+aV
         TNToIBLxcOAAbQ5MQo8BrcZLyFUj7wAv+QlF8Fi7RflzdTLJNatyPliYGhW4Y8t06Hpt
         CCxUw13Rblreqj0/uZSgG+N1i6/EOkxyuHaioQlcuei/cOpefj4GFBinTl/dhWzBl7TJ
         5oAWPCZ8zu2+Axzboj5czXE8iraFU5ZUpO7QBduD1OqjmfK+XGWOy3WW88tiWABS4heL
         UtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RBalMPDlPfU7x7Uah26de2B+60YCynj5e4eSQOwO8mU=;
        b=b/zEylhtRIhYA5AnKKHOATyQmP36VYH91Rrz9G4yA44+tinHTindtcADKx/EOaZBLA
         qjPeu+1zAkhmeP6OpvS3wUlN7CCi/QvzIKVFAzf0qNwbnPZV3GxL84fr/wCPNs9/tYN5
         Ty9C+GonNNw0JeiKnIdQrHOiifCU9x/jo4hom7KMJxjm3wgE/W3Ac60JQUTc9yfjgl0e
         AlnN/nIrIQ4o+l1LIfirLIZ/c/5tbtIgOZ4ANT1ze0iK7qw2g2td1NY0sd//3DBc4W6k
         BYXqO0nmWMAusIhNfyG0FeTwkYJUtv2qQ/Y/n+Jrb4uCjKZQgVkgjRa3KK5nzCfZ6gZl
         oJhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUWsVRUw9jdIE3+3nvh5yIYt8Fc9lau8y9Qoz9n5LHoAVjPSo+3
	iKZl6dLQBk+TtL78kArIPrg=
X-Google-Smtp-Source: APXvYqynyntXbaFvJCd5YfZk4AGeaHJrgqBuoGrveP80NgDp8lA6kLMAm//RBxK8MJfvFv36tuM9mw==
X-Received: by 2002:a81:b604:: with SMTP id u4mr6084398ywh.301.1580827609385;
        Tue, 04 Feb 2020 06:46:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:cc05:: with SMTP id o5ls760279ywd.1.gmail; Tue, 04 Feb
 2020 06:46:48 -0800 (PST)
X-Received: by 2002:a81:7b88:: with SMTP id w130mr6103627ywc.231.1580827608875;
        Tue, 04 Feb 2020 06:46:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580827608; cv=none;
        d=google.com; s=arc-20160816;
        b=Oi7NRQswVj+AzleztNmAZakFji2L245DklS0XGEABB14ihUm6dumXCGi9oBLfxw5RX
         pudMVEUpryYmZ6HxOIfzL1zk/LXLhZKDsjDv28P1Emq9NrOMr0tOJUz/bAApFWkpTVe2
         bWK9W4ZbY2rxQT2Hi5XG+Z+FcHSew66DvCF1FivVahnrkOjORRtdRgIhRDt0l7Z8k9r3
         ke7/PKBNEtgxVw3xuev1033tFP6gHg8KG0NTR8ATS6NTbZrLOLWancg2eiJ6/q594ZBT
         4H2krOsskC3TUv3oeANJTcACGEDsBAwd8+mmkI7obUH9nHwIHS7ksATbeRBgTVobTO34
         rdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=zRNQ7DIpy3m+PwWXwTD0ClyxIMyrry94HGVyBRjTlpM=;
        b=fggLa5O9t8p8n3r44AxE20NwQiseS9dF4R/pR6DNlyoTdi08E3h8A5GiYAErhnPhd2
         eTFnM1kid9Theu6HPTiZPxuU9Li9tUTq2f6TCaq5y3f+zeW0VBy5c0lZyD/2ocdOW9dX
         UiQ8K/0oYEDAeL6GSBzvI9EcC6TKcrlQJMtBxNUSE7sEGStyQj1119noYcJF5EPehzu/
         Kca4uiMvWBxTTLu6gZ/9QIvE+sFJcoQ1VMjOGgEtos7Y41l/+4aGfOH6UrHsYBTs97Ut
         FzL4Jbmye5Dcdt9z5j9Idq+XDj2ERUS+LohLPxGyRvrtwY15+j6HenHhEZkKEje/FgG7
         xUsw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0Hp9uljC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id s131si1381997ybc.0.2020.02.04.06.46.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 06:46:48 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Date: Tue, 04 Feb 2020 06:46:48 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/213747-92db71@github.com>
Subject: [siemens/jailhouse] 92db71: Bump version number
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=0Hp9uljC;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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
  Commit: 92db71f257fabd3c08fa4b99498fa61a41ea831d
      https://github.com/siemens/jailhouse/commit/92db71f257fabd3c08fa4b99498fa61a41ea831d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-04 (Tue, 04 Feb 2020)

  Changed paths:
    M VERSION

  Log Message:
  -----------
  Bump version number

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/213747-92db71%40github.com.
