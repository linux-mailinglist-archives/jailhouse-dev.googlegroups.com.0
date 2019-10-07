Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBIPY5PWAKGQEC6JEWBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 86834CDDA9
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 10:49:39 +0200 (CEST)
Received: by mail-pl1-x640.google.com with SMTP id y13sf8157746plr.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 01:49:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570438178; cv=pass;
        d=google.com; s=arc-20160816;
        b=dGZ/h3X7R9DazxQHvX6KCcRV0VI/Pk8tyCQ2b7EYW5wI/GjgX3JOdoZ4RHhyIElWf3
         SLPN0vH/Ric/UpQlOHQwIRxHg9aIKRT+f1oDOdNYkiQ/4xtJmUan5KqdPS853ymLeGnU
         khf4miAIJ4xsAFM71C5IKQ9HiSsopug43NFUYsFkWp3UXCPSqGBapGILYlam9BdUgchZ
         iOGwFce6Cb7IYCyPXG810+qm+vr41FP9pZ/QFBuzx0LX090ZK4iDP83BkQf+3ib7ywU8
         cQgEmsnF5xB1U3C775x677RWJJriD4xRrhiXMht+pEaMetnWlHaNyvCpqrkGX9x0Nl26
         V15w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=HMlqYZabFM32nkjzCS2JKieS6KtbsKexzeZrDpgQxzI=;
        b=XDksR1g+esd1gHZGLJ6XTc1PKwhlUvxy1/yvXHC3cQnVEAj1M+m/wq2TD7RpXL5w/p
         PTVYPytDuyzS5BwuGkRLkOkOCs5T9g+NrG1r8s7beEPI1I+kNxRxjtEAHAE4E+zQB4Rf
         RzTFVGhDBEwfKLt5Bx8pOQoau22zqo8tIYIvG4StCbRjIz9zDtzWevoBAc9e7uKE/x/E
         M2CbblSrKPbk73vBOJnf1e/AZ/TeiNFXlZoBokBvAexmXpxThzD2KmzGAQr5zfBzXrMf
         0FNewae2LjQOmusP7NCdRB0Dn2bveQYcC4SKWnSAv/Q87GjOYFw5e3r5sposSSA788Cj
         VD1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jh2e3x7h;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HMlqYZabFM32nkjzCS2JKieS6KtbsKexzeZrDpgQxzI=;
        b=XqLR6SHUKJP5s1Ec6ZbkrgEkL/vP4w00BcNOnqT2O2O/v+qL4eTSh304X8+OCyfD/5
         TtXeIpzyLcmeHlbgpe7jxWqSeWnEDuZZDUObrKncBOotVgLuBYa3d7EK3+DQUXshBdvj
         n1hfoKvPoDjc/vVgC9BRvOYkYIlDrLLMIsQUGYC+oPayCOqCbndZl3fP+6KSE8hyTllI
         RynRQUvXcA6cD/fJpDSA+xmQNFzeuVEnCP91zd7gtg8leJutDPV5eiR/5GHci+HRcwg4
         urOT9nYdeR+0e7QWarCzwphsCs/+3i65qL+aFnKHqCzccMgrbQ6NNq2MENpxyKuH6uYH
         0aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HMlqYZabFM32nkjzCS2JKieS6KtbsKexzeZrDpgQxzI=;
        b=UQdoZnhP3P1I6DmKGVjDhB+VoBf+lnO1tQk+tVvc9HzSx6RQF2nVBQelCcD05N8WVo
         nh3s6WALs+YbbuqIixa3ut1aYd5YKzBsXKDlrzAh+DWkwcDEs9+OlUEnVqllkRzjSUTC
         bWHwiUsgrPmmHxRBftxWSmxE9m5A95BRfD0fPEHx4NBu0REeli5sgorQizy6EZYMsW9l
         WGk42MljdRx+pSHHS15iFOF9adZkf7pLYPh7eqgJYYxmd7fi/bymJ0G3NqoVXRXs0Djo
         fQdmr2VITUzVmsZx4LqiiYSNxNVQ5eB6IUMS7D3P4hFdMsdcSSfqs5kHbnIT1FGRaPcE
         dJUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVJ3YwWSX6t34Nm81kcvu9x2wQp+OApApPEnc8BJ8BwMrWdjc7n
	g++9iboUmQNA7SDFzIB+n10=
X-Google-Smtp-Source: APXvYqzfNdHGVNPaxrdlBUDpTCZ5qnpDFPmgK3NIsNvPdHDulqKmiQxHa8e+S1kezG/K9k5dEbnNRg==
X-Received: by 2002:a17:90a:cb18:: with SMTP id z24mr31394411pjt.108.1570438177681;
        Mon, 07 Oct 2019 01:49:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:1e0b:: with SMTP id e11ls3839775pge.9.gmail; Mon, 07 Oct
 2019 01:49:36 -0700 (PDT)
X-Received: by 2002:a63:5c26:: with SMTP id q38mr30148312pgb.63.1570438176870;
        Mon, 07 Oct 2019 01:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570438176; cv=none;
        d=google.com; s=arc-20160816;
        b=jb8NsrfDZ63zaXhhGwl5rhT+rPjSjmZV1GX/j43dF6gB6WgY/JxW6DiWINgY1WW2E9
         OWUU2rsX+zFjtdfNBKGdEeqYX83/63jEuY6T/mgccZ3ypnFG2TcF9IwSdT+0gfDrh8Gr
         8EDjowgzlybg9h400hGoNcb8CvdA74VnMaci2gjL8h2w9ugOL4mOMUj9oWy6Yhk+l8IR
         EWt6njdDg84MDyGJYOYWAwNj+6tYzg7oy7K3efLyaWVmb+ETj7eE1mTbdcl2T7/FolLy
         pJoCmK8jRc3eah2L+4/wY+mdeiLBM0YL5RYLbhmISFSQRmOd+lwLu6hlUHohC9FXuRei
         rBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=xGeuNc2Oovjhc3zW146GZH8CZfqhBlgTdruQwcJUZZY=;
        b=glzf4qEN9Vuh3wpSCrIIrD9c/9vzGdhH/GaJb0zI2/x8/oRzRF3T2i0FOm/ztt13s5
         IARZ3iNRLqHXQJjT/qic7x/f8rFVlupldk17clI+iGGotJo/9jba/0/++Ivh9Uf6KBIS
         4H0wO0ZJOTNhu8xPtZt3jDmq9ejaG/iA8D0HYMSWjoLhFa2QxIgRc7pwNIsSJwkJiQCc
         sTJBAiMXPcBoQLUzutBfG2XW5c67wOxyp6L4lolohK4poq/E6UkvuN8XTUZCg2FfLHdY
         p1IBvoT293HpHd1whec1aZmwE5n6seRB3iUgX0UVX1Iq2RrlKSTwX92s/hxScoD9Jaft
         caiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jh2e3x7h;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id x2si849862pfq.3.2019.10.07.01.49.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 01:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github-lowworker-d93c4b6.va3-iad.github.net (github-lowworker-d93c4b6.va3-iad.github.net [10.48.17.47])
	by smtp.github.com (Postfix) with ESMTP id 1208CA0855
	for <jailhouse-dev@googlegroups.com>; Mon,  7 Oct 2019 01:49:36 -0700 (PDT)
Date: Mon, 07 Oct 2019 01:49:36 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/d1ec5f-8ff311@github.com>
Subject: [siemens/jailhouse] 0943a0: x86: apic: Add full support for IPI
 shorthands
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=jh2e3x7h;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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
  Commit: 0943a095a97df22273c128b5dafe838edc1be537
      https://github.com/siemens/jailhouse/commit/0943a095a97df22273c128b5dafe838edc1be537
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/include/asm/apic.h

  Log Message:
  -----------
  x86: apic: Add full support for IPI shorthands

Adding this enables support for Linux kernel 5.4 which starts to use the
shorthands.

For self shorthand mode, delivery mode validation is improved. Trigger
mode and level are now passed through as this is safe and simpler.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8ff311b9a5a65beed46c6d00a0b5c46b9ed6beb4
      https://github.com/siemens/jailhouse/commit/8ff311b9a5a65beed46c6d00a0b5c46b9ed6beb4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/apic.h

  Log Message:
  -----------
  x86: apic: Make defines for masks and bits easier to validate

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/d1ec5f7242c0...8ff311b9a5a6

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/d1ec5f-8ff311%40github.com.
