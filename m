Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZ4JXLYQKGQECZPVOOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D7149F05
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 07:36:24 +0100 (CET)
Received: by mail-yb1-xb3d.google.com with SMTP id t3sf1814544ybb.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Jan 2020 22:36:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580106984; cv=pass;
        d=google.com; s=arc-20160816;
        b=RdKphpYBX+INnm46HTZdz/1HBAIj/kSY1GJdJjTyUVungnfGP5h05crqpi1kkpT6bH
         Dr3cglZ2ZbprDRKhQYExzl84FwvdtMB1EGrCbBPq3XIkFFjsJIGhISOBX7w37elqn4ED
         IMXIjbthfHIkc1OizvDpvieLDmyDTl3s2jOSKDvpUFVUZUDvpCXzfjSIpX57sNsgteYZ
         TBvzlvNnyUOuGZ6TrJ+dNPZPdTVTD/GcvRF5YldblaJWM9Ma6M1ODpGhsUVywlFQIZTU
         Yuh6G4OMi1GOMMXTKkJSh/kaha8sUs11hhe17YJaFapAmuWaLuSHljGT4blns250qsDj
         Cceg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=jFGYVJYbhtR8ga3QmWOtrrn8ugsIMQ5yLHOykgJAvPU=;
        b=a/SaX0k4GLBzP+7jSatF7I7SVGEPFa235zxJ6iR266UfUsm9cgPqPCMketxnkzDZp7
         6oduIDqJP4RBoQ8w8cptYgqKDLUb8PSiRPWqUhzBDjVJwtdH1v3vPC1kSKy54LnHd7Dw
         qkILOQDW6f1dA3a4HFIb4u30Y2WkaACQXf03HYg/NiYAaCqYcq8wpfcdbkPbP2ubuUwb
         caFSoWBjaN3jFHC4hEFcoFLPfxmmR9lHYaEYth+Jf1RYRP2p+FF8IkeJ5bvnTJdaVkww
         z9NWQlxkCaSqf5ryrxk2JrAARTGsvauE+q90YxZRFEz/H7XIKZw6Dv8EO6uCW/5TAjwJ
         TvdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="smciN3D/";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jFGYVJYbhtR8ga3QmWOtrrn8ugsIMQ5yLHOykgJAvPU=;
        b=RCNU7TF1f6n7EX4Ibnpej7NOehauhv7AwIwuXf2UV2P1VZUGom9oQ2FhSTT8vrNYDf
         BoqU0Tzci3VOY42Q3p3HWA2M7JmQVK8eaxV2LiquFoDomA6pD1YuyvMWlX8p9GBrd73S
         ev2w97WzMw1sgomBBby5LVMVn3Om+LzUglZdxdKQB9vjfsiVJ9bDtjttH/vXCLCU2RuO
         t7/8QSeGTED93O8ngHxXG8K4OJe5KuuVKyQsqv5lF4xQ9jsw9VIk+bwzyp/swJSMHD89
         j2aZfZZAf7ZUUJ17YhbIUWwyZXIqnJZi4LiIfK1s59BsK41f7+PRsvXVOI23Bnhd9KpD
         HRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jFGYVJYbhtR8ga3QmWOtrrn8ugsIMQ5yLHOykgJAvPU=;
        b=TeqRQSx2pm7HNA7w/h982T4jxSEEYuLBsVQdgyxm0hVMywZjUR+zK9QaR4MV3M60a8
         tpcMb2ToI8CTnPos/jUGBuyr5Ka+N5q2IyVEZ9ikkpauFkRgRtiy0tpqkPw9cCUc7IeN
         7m2qcbeeo0HsKLEwngV5uVPho2pbiiisSuWHNlxyBN+c2ZHBAa2jPptGoL4Tm8tY7SFE
         PHTPKjqFjivhIt9V2bWJoK/t8gEgmmhe+S+B2EOItWcVwCQm/WEEnQZstqJ+N/bIpwr5
         sQN9P7Wk1Fv/sMDr1p10vtLbCImV75FZ/ZOpraHmic30Y0VVavWBp8h52DGXxF7RTlGN
         Mp8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV4RNkiaX6DbSCfZ8r2BlvNhgfvkoXMDGqJQsdG8umfi+uyLyLI
	ybeK+Qh2WEJV+TcEW0shS8w=
X-Google-Smtp-Source: APXvYqz3pj7mVy2O0hmpMtuUMTnAEg93G4YKeqseoyQ2ZNuzzHA4cdbSfExtpkE1NdivWlAv11at3Q==
X-Received: by 2002:a25:df81:: with SMTP id w123mr12654348ybg.473.1580106983790;
        Sun, 26 Jan 2020 22:36:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:cc05:: with SMTP id o5ls1723611ywd.1.gmail; Sun, 26 Jan
 2020 22:36:23 -0800 (PST)
X-Received: by 2002:a81:6c04:: with SMTP id h4mr11879458ywc.431.1580106983180;
        Sun, 26 Jan 2020 22:36:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580106983; cv=none;
        d=google.com; s=arc-20160816;
        b=mocVDRxoSrmug7w2Y/zipNTz9ClqTovc0LXsF3TraMf8rYsXtDuXr3DVHVzuXOLURg
         d+BHBLqp3q0FYgoZUc72Bp6b93dToIImuiO3J/x5uhPY0LoUNVziPWbbTOHdSzDYMc9Z
         enFSjOjnlZbKTvG9YHE+Uc0cJ+yJqH/tCIbHbyAiG/WP8PhnSvIAexdUb7EEtN5cctwD
         iYC1MGIZuwOlMC/PIf0i6WtA9iV5eJYh930SDRD+Zf0QkQvozctr9V6OAa2yAzUkxKRe
         3+qnhdaB0GYiXAIr+CBW9QtjWCGe6C9niT7aH9pndiJr6LXcqnGInrs+0p4WThnwwVD/
         ZnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=MilwlGEOeIMwayctWoPN+oquvIcePsWoIRLlFwDVD+g=;
        b=bZinFmvi6L6ja6IeJuZ6ffMPGuoNlxaQCFALf1C606RMnS9n60Q331z+nvIPda9RvD
         1uXNgG6UXHfT9JNpl/JYglRyBQX14rFtyzfmSd+GfaiQIYoDum+cseotCFb2BaJI2kq+
         INffoccoxoIHi7aFDGYL101f8+gCj/q+YfiA22SbnAuJBFfrIHbkjL7lUaMv94FqhUDi
         iTy/BHYYUTjjCM0WE3kHev6KBiZqXKymX6wO+LUV3F438f//sstEOwz08q5m9O6NnYtC
         WOF5KOh/8JUYIk47hHP9zFbzFXxTbYm7wqCYCm9xgn/8O7LnTDqebdJqdSAzy4wztICr
         yT1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="smciN3D/";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-27.smtp.github.com (out-27.smtp.github.com. [192.30.252.210])
        by gmr-mx.google.com with ESMTPS id f8si864621ybg.2.2020.01.26.22.36.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jan 2020 22:36:23 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.210 as permitted sender) client-ip=192.30.252.210;
Date: Sun, 26 Jan 2020 22:36:22 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/f64e71-5ea603@github.com>
Subject: [siemens/jailhouse] c1d059: core: Tune comm region's flags field
 definition an...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="smciN3D/";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.210 as permitted sender) smtp.mailfrom=noreply@github.com;
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: c1d059a56b20261f75a268fe7bbf94f3e796d99c
      https://github.com/siemens/jailhouse/commit/c1d059a56b20261f75a268fe7bbf94f3e796d99c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-25 (Sat, 25 Jan 2020)

  Changed paths:
    M include/jailhouse/hypercall.h

  Log Message:
  -----------
  core: Tune comm region's flags field definition and documentation

This field is static, thus volatile is not appropriate. Rephrase the
field and flags documentation for a clearer wording.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: beb95b54284b1defd0f1952d43f8143cf303d38f
      https://github.com/siemens/jailhouse/commit/beb95b54284b1defd0f1952d43f8143cf303d38f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-25 (Sat, 25 Jan 2020)

  Changed paths:
    M include/arch/arm-common/asm/jailhouse_hypercall.h

  Log Message:
  -----------
  arm/arm64: Pad comm region to natural alignment

Better pad than rely on both sides using the same compiler logic.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5ea60323214f8cbd4c12c529acfe5223a289a10c
      https://github.com/siemens/jailhouse/commit/5ea60323214f8cbd4c12c529acfe5223a289a10c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-27 (Mon, 27 Jan 2020)

  Changed paths:
    M Documentation/hypervisor-interfaces.txt

  Log Message:
  -----------
  Documentation: Update hypervisor interfaces specification

Lots of things changed since the file was last touched. Add the
hypercall ABIs for non-Intel-x86, update the "CPU Get Info" hypercall
with new statistic types, and extend the Comm Region description with
the console and non-x86 extensions added meanwhile.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/f64e719b01d6...5ea60323214f

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/f64e71-5ea603%40github.com.
