Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMNT3XVQKGQE46UGFTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id CD493AE517
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Sep 2019 10:07:15 +0200 (CEST)
Received: by mail-pl1-x639.google.com with SMTP id b23sf9383504pls.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Sep 2019 01:07:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568102834; cv=pass;
        d=google.com; s=arc-20160816;
        b=oc3HsBcnP4LpIqa1fEpJh7sglLyn9jeTvBlPkxwZRp2Hj3/6Wy10e5j+bZoXNZJ18E
         UcgR7ZXtm2l2vyUDGO0rgypN50VPBmOUzjjjJUwu6unLbnwO7lSS7K1khn6UDOs1VND3
         yjxFDEXD3Z8Z2NMEix+gsDN5sjhOh5cfWedf2QCkT+jesibXkibe+nIe96Iz1PaadZ2N
         lgFtfQL39cpdzWP4vR5C+aLSwA/rX2FFwXkRqqeQuvr9I2xhUcG8D0It8/sUnCn3/agb
         92/mZFY/2INE4puOPihspSLWMEObvWHPPfu1BOJ9xKZgA0JcTg9MhxFMMoXcnhypiQSv
         GDzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=SKHVV0nBcZvQy5rGxW4aSwHdt+O3mPWLbecBIePhlYE=;
        b=Unf6N3ihIpIl1LxVWDF8zPlzHnJ9297BQndAiaqiDEBFpg3yQOhf/uO6GA6zmQYNX0
         ygV9QTuTbCaDw8oM4RKljlJVrCKr9vW3wN6uPy/h5C41G7wQg9Ekv2oREFT+qclbNsxR
         Lbsja2eNZv712t5wgNoaiV8LXkZ8Igz7wSdcpeNJpngCT3nyyWtpByYcAUyGqTldjObL
         oXXJOOzIilGVqyOmHufd9pEZm7HUvsyeLOHWygmmp/aGWHMuXk910H7QB+wwJ5zLxQcS
         83sSmYKcIwkECz5n1IMW7XZXHsZNn2x1JYmGFC01msZTihvmDubgZdijWn25HR0KknbB
         +OLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tKnE0SJF;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SKHVV0nBcZvQy5rGxW4aSwHdt+O3mPWLbecBIePhlYE=;
        b=HY1u0iM8/KnU0tOCOocTzkZ48ZUu7TDYEyPGhRI0GKTmFK18eECRuYWZbBMiDae03Y
         +OBAuvDfG7IJ19CBP2m3iebzAkKvJoZ+nBDxFXSvXDxF03l4RNkjuQi5c9Dv26rORjb7
         JwhY0pKP5eYxuW9JpSd69N9TwWT6ky8SMP4q+aMAGOARMbh4Zs5u2oepzcbOW83cHYgI
         k/wco+1Z5qH8zc+CT82sR4QcAItzbKwEAuS5NUsFXET25z/EdIcjYTnwUHLjmOtyol9z
         EWRIiwP6muWYcFyx4GWJYHS14M3P5ZhZcJIvuvkpuDfhQIofmwXh5XfVmlo41GyPHjo1
         3UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SKHVV0nBcZvQy5rGxW4aSwHdt+O3mPWLbecBIePhlYE=;
        b=SeULkyvOc+DK1+1mYIv8LPfZUn5C+VTKRB8NyXOLrvOOYO7UUf7TQxtKxl90JtbOPk
         +slg8ExLhkNLYRb68W+5GnqgVVKApPUvm28kjWQZbDsVOJvJRZZtUalVf92Fc5QuvA20
         QegeoO1zVKmjxnlaWH4SwQW75PSTuWY90ijkIgDlinMLkeNLYJiJQcGBFlPbCNHJqySy
         v+Rqo7g49OlIWQiSEtXo56pT6Kg2CNFkzHehl2cjRf+xt1cOsmEK0CFIzwIjK9XwVYSL
         39zC0mQMJLshQ684aUL5LMUdOaOXVyOgCmhNiUhQ5BTec6Ux/wXohA+emMv5xsWjSycN
         dh8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVQUJjAA8THyB1vwNUruzFTsGfMSIv9rPZBL08Oyo1X7dq3H+Bz
	KHJOc5jnNrBCVVyOeqwDy5w=
X-Google-Smtp-Source: APXvYqx6QflH7QYVt6OdPYjRbaQm8w2NJ7v0hOxTMnZVbHtRDESnarg6jDevpmptIvDog1UeQTMb+w==
X-Received: by 2002:a63:6fc9:: with SMTP id k192mr26082759pgc.20.1568102833846;
        Tue, 10 Sep 2019 01:07:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:a9cb:: with SMTP id b11ls4350092plr.8.gmail; Tue, 10
 Sep 2019 01:07:12 -0700 (PDT)
X-Received: by 2002:a17:902:d888:: with SMTP id b8mr28493778plz.272.1568102832873;
        Tue, 10 Sep 2019 01:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568102832; cv=none;
        d=google.com; s=arc-20160816;
        b=i6Y6WHbi9jtAhaN3y/h+DdKhowx9UL12Kxu4sU4hEYG1Ps3b8IYMPPd0LhcFa+QF3A
         xIhk/cOiN86+oVysPM1Zv5sG6fhJopVV0Vlqhm41l4TdkuP8Fc9BR69a5ohtaLUCkKSs
         ThKXRKaDNNCU1T4hBrYrsrQalwN5IUrWd2gSa4yJBZm9l3jJl7Jbm8b/LtsvzW2M6jUP
         2nGPhmEuptkShoVfDAOsQOAuwkCiWyJfn5x6RuNtPxZHc9h/pVCi8Hj4kwssX/mnIAMT
         1DyhHbXx/rStA9QI9RIGFW4IRBxpSB2ljqcnAGGCJx/w/r8A3jtae63Ta0ZgM87smzet
         ejxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=H66QOr5zWE/I83iuJz/RF4VMUa7VlFL/tgY3Fb7L6x0=;
        b=AzoxvThofaR6leySnMHzTIuCmRlX5d49lrDTo45dsuuJgymmkA+niqDthVbe1W0Z+3
         Xvx0sSRca83FT+dLGl84oaUqTEoidyYtTarAOzArj5e8KtZKdGmk867i8bQCZknBzXle
         u4urjuymJgiBS7cicJ9+KaDYTH+nMpnDmfSLdJYppw2sF9P8cFB/JULPHZOPKyUjvJvO
         dcEVu0gfRuFsmWoeMW6m3ScQOfD0UiRCAAWg50RLakLWQlryxp39fS2VGw8vQCBtDeiv
         3PlYaO1pBcHfAtonHtPQW+ZZW3paybHygN+BbRrNHawlrPRmpHwQN16NXA8zXFBpznaC
         9yPA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tKnE0SJF;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-4.smtp.github.com (out-4.smtp.github.com. [192.30.252.195])
        by gmr-mx.google.com with ESMTPS id y8si44437pfg.2.2019.09.10.01.07.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 01:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) client-ip=192.30.252.195;
Date: Tue, 10 Sep 2019 01:07:11 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/8e77d6-955a94@github.com>
Subject: [siemens/jailhouse] aff3c9: Extend page table size for arm64
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=tKnE0SJF;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.195 as
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
  Commit: aff3c91f5c46d1be54c65c00328d4364eaa94fc7
      https://github.com/siemens/jailhouse/commit/aff3c91f5c46d1be54c65c00328d4364eaa94fc7
  Author: Oliver Schwartz <Oliver.Schwartz@gmx.de>
  Date:   2019-08-26 (Mon, 26 Aug 2019)

  Changed paths:
    M inmates/lib/arm-common/mem.c
    M inmates/lib/arm/include/arch/inmate.h
    M inmates/lib/arm64/include/arch/inmate.h

  Log Message:
  -----------
  Extend page table size for arm64

On arm32, the index to the page table is 2 bits (bits [31:30] of the
virtual address). On arm64, the index is 9 bits (bits [38:30] of the
virtual address). The page table must be extended accordingly.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
[Jan: style tunings]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 955a9418df6edd88cf0f4496b029312df0bd7511
      https://github.com/siemens/jailhouse/commit/955a9418df6edd88cf0f4496b029312df0bd7511
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-02 (Mon, 02 Sep 2019)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  ci: Update build environment to Ubuntu 18.04

This allows to switch to gcc 8 which may report issues earlier.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/8e77d610dd48...955a9418df6e

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/8e77d6-955a94%40github.com.
