Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBD6RXPYQKGQEJZZRCAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1614A541
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 14:41:36 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id i9sf6098747wru.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jan 2020 05:41:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580132495; cv=pass;
        d=google.com; s=arc-20160816;
        b=OU6v2LDmXSiQHijTonKGhb3knCtSITLNkbsW+eGKTFuQz7+8FxEQQjVGMsTleN7HYc
         6hFFZzoUJ4QCEeJ10BvXOVZhDYJYSVMOdgtBJ1fr89Nqz45Nu2u3RsthOa0INHvCXxO7
         qg0QzRXSpRwoCmpKU9VRGNcS7M6agYUO6ZxyuIwobPpaFjyEtTJZMPURDaZpYNiOe6rH
         noq3T5ferAsyjLzFo2CkJ4rbbqHEzd1P/Cto8yY0WBwqD7fGyNnFc5PS8PvWSvliDgI/
         3Zt/yhDpl6rXD8nRA0tz6sXmHO45oTkw1l9c7fEikyVzPXmJDtfPRax5ZCNVE991N8JB
         ct4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=7O2gKynmy1gpS3XbcQCU5Ah+dD6fLuM2M5aeWgw6Gvg=;
        b=IrRBJym19WG6ak+jYgHXnNtPr8VbNakG5iWSw0c8p6+48Fuj9/OItQ1gZJsHrH5Qjm
         pIA8rzanvlR92+MtNJEOw0uEcCxojyjltlGGhxwf+zXbMhoaDHt6Xn1vZyS3IdVSJPHN
         aHpy9OfiyAIJN4MgUhPgNrU64DuFSsZ7z0Q0pWca+LQCSUPR+iyFQ6xd1TeScgSUgX+d
         rTiyfxlKuL65GGnhPlxvBfFgsc5yTpPnF0qbmfyxOlkU1RhVQwM5ilTDie6IbjSGlZKW
         vYSbhA1Qsbadcw1Da1MOVIYKcoyS0rBkIjq1DoWVUCtziNezuh2WtLgh7WbDqEuJnMj7
         kQ3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=I4DT1eBC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7O2gKynmy1gpS3XbcQCU5Ah+dD6fLuM2M5aeWgw6Gvg=;
        b=Ni23zFKDCUFlnVqoISdOALQngL8CgxQT00v0ZSoLFOuJgWk1Tce1k4spXg5/5lMfT5
         m6veCtNci8pTGn11j7poJtpjuu0LKmUaD+eL7TMbypEyrk/XnN98lUP4soF/6W/Zft4A
         pLPPYZSmx0CB0/02MGfAx3QrfRjDpMbphffxRqdRIaf83BV8A+kh8cVF00N9OdA4aJ+z
         vqqb7cTXCnJxn1Zu8lGlk4T9oxYarkedqbEbRxAOFuTWswVfLVaNn0p2ix8t9HIDHMqa
         YoLRcvTuprmvwMklagPGEQMuuwHQ2ZwagIk3RrRxsOoMcEWxf+ZBSDqjDSanO7hit2LJ
         SPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7O2gKynmy1gpS3XbcQCU5Ah+dD6fLuM2M5aeWgw6Gvg=;
        b=tyUvwhg6/p8kWrZMbR6HvRkfl/iNVw4PA//wlOLgRXzOTCZNw280l/DnuHGAdE20wG
         Jf1s1lJI0GTiPNYk7GBW6eM0tzhx1i1662riTAlgHWUjyTLKQvSOpgoP2g/OpxggncGh
         D1buR5+pT8pgnlDpltH9fKC1xZdMQBhvZBEyUOcncqhUMcJ1p2PFsnx9U0xyHJrJtm7x
         obIbzsT3/QZDMEr1OvOkbpU++T/u/2LB5ss/HWwz2fRSaJWoMEtni0bvfhF5QI8h/lUL
         Q0Sop+2ziIvqA085irxBkWBYM/DbUwlqq67X3XcvylaOx7jGbEUwO+yXW45zWluusZg8
         Zr6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVnxEAXxBBgKHGGJFc7MgN5Ark9tWN5rMuJQfKB6Eo+A/BQDqrf
	mrIA7708EEWyy3e+ksgjtlY=
X-Google-Smtp-Source: APXvYqxvZ2Io0Ii67WmtBTrgpPmsl9bGLBv2147/JD346lhWn/MJrJoVerf3UNrgX4GLXmLvk+zyAg==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr23093151wrr.116.1580132495808;
        Mon, 27 Jan 2020 05:41:35 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:288:: with SMTP id 8ls2865445wmk.3.gmail; Mon, 27
 Jan 2020 05:41:35 -0800 (PST)
X-Received: by 2002:a1c:541b:: with SMTP id i27mr14524532wmb.137.1580132494797;
        Mon, 27 Jan 2020 05:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580132494; cv=none;
        d=google.com; s=arc-20160816;
        b=mEic7GFj/Y/2CapJrx43TcYia1ceTIpwN7Ip2+XyhC43HX6JAtlF38t6c9TWLGaiDo
         ks62InWm1nKJe20ZZKbvADlUVXrfqvhHi0rV1hNbV9XgV1h/SO0+k+q0GjTyxly8d2kL
         H7xLWbdNFwP6qCKp5ESJz68C+mr66LoMAS5gc3Aj5BlTpahdeQVXmdcnqYyBTFkmmLtC
         COvcjw0gd3aP00WQSU5/v+ZGCTye3S+/UmJJR0vU+gFWafYsizG6GQ7fVUZaJz3LIhIC
         zUnrKE0Hy/vBnZXohcUIXV6j6jVS/wvXR0YKnjARkKmMfJrzgZFtXtn1dsYbeSQ6xc39
         b0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=WHMbMKaLjOpijltcEn2yafC+x2SoUbjvNNaH3tpCspY=;
        b=nKuu4XWMbC/bU0gI3vocjh+ebdWGw4Sowl1N5HNoXkamlfvkeT41JQFeMxShXoZECL
         Zr0QFNUk6MgpkhhQB1U0dquDAOFNabL16YcuIJYq73/i9zPyeL/pa+LfWrrYEoninIq1
         88BYixxIpAOAzYBQf+M7n/115Fa+dWF/ISxdZT42ZLlkYfCsLSu+SDdQ+2r3+2coYCEn
         fAH6XhVezLP/xoFvPzqlFbDTduVvkWQs0HLIaB6naqhIVnVx8ivKoQbWUwxFA+9syEHd
         IpdzFLMcKOMv6tbJSkKApSSBlt2S3bpO56NiDashsO7GPjIwac1s8MVzxn7aSR1xmsVs
         ABcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=I4DT1eBC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id y13si510167wrs.0.2020.01.27.05.41.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jan 2020 05:41:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb101 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LtFYd-1jbLld1nHH-012r8l; Mon, 27 Jan 2020 14:41:34 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH v2 0/4] Comm Region tuning and spec updates
Date: Mon, 27 Jan 2020 14:41:23 +0100
Message-Id: <cover.1580132487.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
X-Provags-ID: V03:K1:YTOn7Ao9uS/8KT/JOpdfuwvpkXXGlL2R5RhTBRAnJMn3oVH4+N4
 10ttYj28w4ch4qn8XFQHUfIkCbrKkD9xfLyzupE6wH7CkzMNkFOAaxnl2WP/XOJsF5ZcP/r
 m3WJwIRfB8wpXAksJINluAFd8L4h+WBZxJRBQxh1amc/twRRO7HET83jYR2r3rficSJOuMj
 dM2MTcNy9AyDBzPAJ56Gw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MpcNasHOQds=:Bf/ESSWmgQIZCNTxIB/rfL
 5xgQLewl7PIeqJj+/ogbLudfodww6Lpush7POTpd4OC9l83tVswJRiBTerf+n2SJ3sLPqUlAe
 me+cgEZg+zmrfmpr+pOKDmgEQQxlL8Y2Iwe/IyNOrjo7Vahan+f+5cFaC7OxHLvnrjCohcda5
 FPb2mbIsNsZvQcjT+VuMUYsGtWURHsXgyZC8dV5SKpv+nZvWtcBF2gRSdcikeitIj0Bs0ozhz
 +FNiNMsVk790sdQ4XzEcoRNvzfpkKZeDMd1Ok90czLxiAWKfqn0lLmpJ9dV7zc01JCHeJiJzZ
 tempAYhJCabtVFYo3uvSBir30+hUAE8fr/YnzGJM/7+R7267hnmVX0qHwMvwlo0NTNHZQXcpy
 UPK1deh4lGgPrXkhYaznj+6mRWt4KsxVfNytUTBESlQTPCueSj9LaGZRDf2xkHirrY9xHB2h5
 MKGPaCPVrLJDH32bSvBFWZg7OkDIjzNoVvCgDCE9+vaiUvroWBwekqGCqRBoX9pkTgBpZ9Mxp
 Ek+aDlSZh6BdQQewF7aj23KiRU/qTV2LMwLr2JNxk6LJpWi6q+CMbnIm14vaDGewv4xkSlABh
 F3T+Ft1iPIh+7HwXP3gfLiBQAd1LlY0WlaZjebsFdvZ0LHGIjiUVCXvh4IYkHmhXBEW8U/xki
 EbqW+E9wjzLzoy9OaAVgcqPpnYl37gC/bHNkN6kSLA73o945VPpYzV7fJb+jyRiFCSjcvxJQh
 nuxhZZigXqs9bC66AKRzHIHLHUeauosHh8mmgY1NZlv3DJINPJXA2Zv3F/ISpeduRlkWO3Qge
 s30MGECEzrKJdR597meTff4d60q9QY9xGi/ZwgeJriRhD4CkaM8kNFIlIkaDsMqJyeXU0sQvH
 P1d9l2iskrd24iCNwZhszPQwpnOjyN1H2JGKGQ/5YiG89n879r29IJrDX9AU8gXsGUnLJcSbQ
 PZy5ZmZD+xFQR2hFvSpLWlQNSbE2PcUSxQKtQID2VyhMfwan8hiUTjyRbFqUVQLVOkEKZChNc
 8ZfQG6IsT6Wa/qb6oWBe/AkRyMUYme4jQsdFoC9Ig+RDHu8l91IBVtjTL3fkvLYeo2+K0Al6F
 hT7+babU1MIMRy/jmv66ZWqN8ajAnQPcENjY2AirvgiGD/NFFIx4i/wkhcu9KeflOr1CStiR5
 57brrX626Yv0Ad4kLyVLMzrNDN4YGN3vwwhjoBA8BB38Bvpd1SBr3AVSrEIMCKfzoa8paklN5
 3c8xPb/GLIAAQmAnz
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=I4DT1eBC;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
Content-Type: text/plain; charset="UTF-8"
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

Changes in v2 (all reported by Ralf):
 - add patch to mark jailhouse_comm_region packed
 - fix ARM API of "CPU Get Info"

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>

Jan Kiszka (4):
  core: Tune comm region's flags field definition and documentation
  arm/arm64: Pad comm region to natural alignment
  core: Mark jailhouse_comm_region as packed
  Documentation: Update hypervisor interfaces specification

 Documentation/hypervisor-interfaces.txt           | 153 ++++++++++++++++++----
 include/arch/arm-common/asm/jailhouse_hypercall.h |   1 +
 include/arch/arm/asm/jailhouse_hypercall.h        |   2 +-
 include/arch/arm64/asm/jailhouse_hypercall.h      |   2 +-
 include/arch/x86/asm/jailhouse_hypercall.h        |   2 +-
 include/jailhouse/hypercall.h                     |   8 +-
 6 files changed, 134 insertions(+), 34 deletions(-)

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1580132487.git.jan.kiszka%40web.de.
