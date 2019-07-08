Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBKPLRPUQKGQE2UKGCUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8BD61B5F
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jul 2019 09:50:03 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id x5sf8804688otb.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jul 2019 00:50:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562572201; cv=pass;
        d=google.com; s=arc-20160816;
        b=IOdrQvdSmjWv/qLB+g0tXeKh4RIJJSBmXk4j76oo0hKThHtI+zXz22Y9KhDNmUDL40
         n5YJ0WMHhBPaJBHx1MBB4UbJuk/ZA3bqNk9WwxvSIaJqAGIGdEA2ReUY39+AjqY14BQr
         8zKOz810HQsyuicbztkIgxfrpDS0lUIJN4H5nDtsfooBFPp8id7EqQcszaMmhBQRJNwk
         /utqZkMrLac5P7Y4L0JaQxP+buhq5+G+ItrN6pmDYAgad+msUKfBlCBqbnGoLPiYSNqk
         bQ1PTS2t8HQyyRwZ2Gp0gBe4wFUPLhb3c0NnPYBzShpaby4KvbFJRReYi48g5aMY0JKQ
         kDOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=dY7EyZqYJkF+hUouEanwNmdm0eN4YHK/lI/Hyc/Hn14=;
        b=GVYjnkEQVaox5JXC/YO3wsq8EYa2s9zGXD2sanHf1vEYNN+3+ySbtwNT0PTKQQgf27
         pIb5mqcYW+nNuvIjBS65FkwvDm1pQZpquQsT2xjlzuj4QGvji3mLy9ibmAAIRS+cWFcE
         Kfx68kjtk92/5zQuiJzMSSjR3pl8S4JrIzEcOGwRQg4Ty/EAJMqgWC4dTKIKp6zK5n9Q
         MJqygVybBhXUfZA+++Tr6pv/Bwfcx6ro6Ho6seNVbs5wuyT6yFWbyzNyIxnOodJCr8Bt
         jnlGvPKQeEiiEYKy7MxP3BI9be7iSWbQyPwqCa6JifAoX3isQgUtjx3Lc5EGsGf9GGKY
         O5Hw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=j1kJSo7g;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dY7EyZqYJkF+hUouEanwNmdm0eN4YHK/lI/Hyc/Hn14=;
        b=ZWSrVDPLtl7j/GI0oDAIsip4Y0LmcytfzIhoTwATEhcfOBrWLvP4XYfan2AfOtvSfS
         yPWzIK0UfozcCpyl7P4yOLb2cFNrDOjt4mwtXv9yqcDa/awxoEYspcALjvrP5ynqT/DL
         dR7ZTpjEX93NmWEZwOCCEExHcph5R2GftdTJqN6oali4HovlgbcFmZgAI4rR7fF1o4Av
         y4th5unoDsNTwFvvs1krkVgBiI2fAM3ubAjyRzT86Xlldyb7mamHvukXy7cJispLxZl4
         h1t67ENWPtLMBSI7Zf2BZyRE+00yhQ6y2YimeKSGf34Jft8QhphJPhdADyfSy1wLa6uB
         vGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dY7EyZqYJkF+hUouEanwNmdm0eN4YHK/lI/Hyc/Hn14=;
        b=km4XO6TG3FPiPUIC6YRgstUmbvf3VkZf7leFR2PxFeeJcfgO/H8QWKeiWWGpXEdxJv
         u+o0WRp7asotu/cNulMaUHokV3/Ubi/LghlrutEYntw+HDKf9jvCnj4Iq7nZ+HV34Vbj
         LW2X1EtawHNNCyqPYhUD/3Z8b3US9LX2X6HU37WHvA4tKJVExyUAalwo7ol/cpQjboKb
         7uFnhyF5R8GOhEM++MYojX1D8KDdVi9InWKHGCRhwN6GLQSKI/hKGTd/TSK6EFlCpDUW
         ESKQW7d0hmJs1CvE9WjCIteiEQGYpbn0Q1eSg9iamonYM58r6H1HLUfAUCDvGt2JvDF0
         r+rQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWE5k1spTWxdIcJuFPDMVK9UI6NJIY8I+dDq+XHftUr9I1NLPke
	9YFRFp22kZ0ddQYey1PK9gQ=
X-Google-Smtp-Source: APXvYqzOMk8m6MDh1rSrlbMEPe6hVpTlCxoTMl7byWny/iqH5q0tDJaqbL712UIJ/ak88wH8NLK1eA==
X-Received: by 2002:a05:6808:49a:: with SMTP id z26mr8710718oid.177.1562572201498;
        Mon, 08 Jul 2019 00:50:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:1108:: with SMTP id 8ls1878801oir.15.gmail; Mon, 08 Jul
 2019 00:50:00 -0700 (PDT)
X-Received: by 2002:aca:4b42:: with SMTP id y63mr8533373oia.168.1562572200824;
        Mon, 08 Jul 2019 00:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562572200; cv=none;
        d=google.com; s=arc-20160816;
        b=YXAh+osOElWDaEBbJ5pnYAHx/mxM5MAFbQ3xmassWX3p7MtpHplIH6K/G/Bvoip5+8
         gBpT8R0xeqe3wXeCfloT515Qm4VOSSkCmiMCXVhDa/VK4yEX7zbbQwmv+INjHuol81dL
         TTn7jkoGLIoPiKTHj9sImriw06HeOJhMRbXmXvHS8tKG9DIAx02nqD/B1eXhf8cwpB5G
         0ea9vWxmZAxuBR9ht47hblil7D+YXeyDxRhowpRaxBbz0vaGWKMsLtxsl8U7fX9nYl3F
         JDH2N+CKcUyeK9nVFTsBPDPi4K7EKVTgeNXy+hN2Z7pMjAOjmPQ5HW5R7vHgHShGilMn
         QzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=/tJgI76YIuITRwKjAkCrsiBB1C6wvBAZkS79qxmyAAg=;
        b=uA29eDKbxOUtuCphNeSfcYh44ZfgHv1heThZeyzk6a+N5NcNLGwNzjoNiQHi3GHMCd
         1ygb83Fgj/nf/BfmBrF7VocXxqVySJmAB6oeOxzpDjPhocxtmiz0RGeC7eUDmoV0Z6l0
         K3A2KVt1z6wnpbzXNJkCkoxuAU7sbgSFBd92kSoF4biBVemIuf7PGQVTrrTxO1M05Iqr
         SOTqPqGbuKybf+l3jt2dVbYFWjNsPHFMPP39eY5Kt2V1iSLnAhTqmSHU4TQNbiX5uW6Z
         uve19yvlKAC10AqMnixZH36Qt4TDlTawVRXjib37CIMAYNTRaUg+akKJtNL4MXa8FEcK
         HePw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=j1kJSo7g;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id p6si1217233otk.5.2019.07.08.00.50.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 00:50:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Date: Mon, 08 Jul 2019 00:50:00 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/a17c46-58052a@github.com>
Subject: [siemens/jailhouse] 58052a: Bump version number
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=j1kJSo7g;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.192 as
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
  Commit: 58052a7a9d1f5904d72b1637282c877172ee69f6
      https://github.com/siemens/jailhouse/commit/58052a7a9d1f5904d72b1637282c877172ee69f6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-08 (Mon, 08 Jul 2019)

  Changed paths:
    M VERSION

  Log Message:
  -----------
  Bump version number

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/a17c46-58052a%40github.com.
For more options, visit https://groups.google.com/d/optout.
