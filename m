Return-Path: <jailhouse-dev+bncBDXPDIF3WYKRBNUWX73AKGQEYYRBOGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 213781E63F9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 16:31:20 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id b63sf1788263wme.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 07:31:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590676279; cv=pass;
        d=google.com; s=arc-20160816;
        b=LpXHV/ZNfhBq4PFlsuQ/O/d0rNFzC9/jjePZMmk7YLgPq0RFiyYHGp0gwRKAUNehSY
         wPlai1RMxLN7jpaaiW3oj4/zZChAOaVA4RJlKh7174mrIQp+/X7dIiIJI01R5j//5Czv
         u+fVDh87neofThOSRz1MX6y40rHN9zMAqzDgabgeN4WErTymgHyrfKDVmr8p50UECEha
         wkQ75ZJWl3dIm8tbvmcPQxyVAIg8pzptwIV5XXfxRINAwZ/T2ZlnVhIHFuGosEmZBnfb
         7HdOLon3lBg5d3zl/ZKUcCyZ6kspIp4gaahYW99BxjOmJ/k3sfjmaGN3zY1cSDykdpOV
         Q9zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature:dkim-signature;
        bh=IN8at6O+EvL6bLzCFHdc2i1tTIfK7XaDLHedO+3Ti7g=;
        b=QTVyxgCFHkxYN2y+yAmk7/0vg7zZtjMzm6tJBtzrIH5mcU89cXFWyDNdrqSFiHJkHt
         PFzd1FDUW2vf4rrDPgZbPNPa1RcrlBYWdA1ISZmZvFGxIdPpCh3pQcpO3Kg14IkTJbp+
         T0Cong9J5Mxq9x36q+goSuI1Ld1Pt33UkuJGvYX1eh0ziucoQq+nONrt0Crbig9i3LvV
         jS/fF98smxsxveEeGcznHjCAxieWtU4pgUZ/ZnDb9R8RoeA/VXJ5D7D/Hc2etDNPmcG0
         fI3rs485I5JgW1gvx/1jM1X86u7+sritaMioxf/YhliRhKSC9qSLYtbNl9lMVS6NfgHP
         KdEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AIgfweJB;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::644 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IN8at6O+EvL6bLzCFHdc2i1tTIfK7XaDLHedO+3Ti7g=;
        b=XPZN/U8TGJnhbOhzZYWvZsXpNeARDpNs9GtzdFkxmyKA1d2vG4S0KENVr8lKD5xQFr
         uiEa0OIEApnc/AHguiGvGm79EgQ7FCZxXucyoyEpqlrh2+EyPaTMwSmRXwUvlWCTL6+h
         wFW0Hjmu/XR1c3nP2VMF0Ouew4f1krBX4qmqw4iACwsJSUL7QOaa8swYsbDfE14rwwsC
         P8hVwmc9DJX/pCTA6vy77s3cJzH/V1/AR5Bv9tYFSfMhSzehNjqVWwWAhGzZARYgyGtH
         eZrQDH99frmWVm4fjKHZTGr+gi5AOA+/wEOZwouzWFQv4jQdChbmbpYLR87Ana09zUb0
         sPJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IN8at6O+EvL6bLzCFHdc2i1tTIfK7XaDLHedO+3Ti7g=;
        b=F/e4FlrnPtLyz29tbT8NKJkjjyuQ2+pCA7o/sfS17sQ/1dtc9Z/E6ad9FZIe7uBhWM
         uNaHOcR6QNO5aydoU+AtAR/Z3fV/OmitGdDapyBZFfrTyY+8+tlIwZJa72kuNfU9Y7ua
         Lxb8lHi40B8m6szbEj0RGXlsH9OZasJUh3kY4WRa+5PICxTLFK+lULhfVJXu4Dg/gh/A
         62ayJAZDSYG51Uq0Agl4cxEpKuObplIaI2ZfRyVuBRv9L1JcpkMdvjwsR0aEicvMxSBl
         mFzJ73WnKaBza58xIEr3pPlXQpx7cz1ZxcVypCvuJRUMzknhUdxWpQUdnA+3ZBi/ORGG
         i8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IN8at6O+EvL6bLzCFHdc2i1tTIfK7XaDLHedO+3Ti7g=;
        b=Vw1NCsAxG4vAtgUog/R3jccpIO4/aGv5ZXEasxmu3I6bJnjwfLBZNqbILgrIpl6u8k
         d49f96tqySyB6RsMW3+E9OdIx/1b43KNwU5JmmHx2ZZk+KKBRgISaqy+gzoeoAwFVWVc
         oEAdfhtbZBxg6iB0JNZO0XwHnzy1vrkpGC2UGY7jtyiEScvDUb7Wa1tWCUzMpNjAxsxs
         /+k5JbalXHB3D2PKz4YROZBfCfnrM2lMrCuOd0jlpxr0BJ27atWYoQ5tBHDjSYtplYq/
         PVaiTbjMk/PcrLvefJ6alAZGRMumWBE/Nni70YZpA7Li4gZusQxUwRA/Z3TEt/6vX3sI
         7YLg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530SgpP3A3JOEaj7YwPF7BJDkAr+98ea0hYUF0o/0/RMurMbt/Ng
	fLQHGIEgO9H1OGuSrTYLXO8=
X-Google-Smtp-Source: ABdhPJy8dv3UMT+dgm9aePBgDU7bsVpfBq0ZTi1hGaX8YFdrADgzcK0CjpZ7W9Xf7t3dUwucc/hWEQ==
X-Received: by 2002:a5d:5389:: with SMTP id d9mr4081971wrv.77.1590676278749;
        Thu, 28 May 2020 07:31:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fac9:: with SMTP id a9ls2842129wrs.2.gmail; Thu, 28 May
 2020 07:31:18 -0700 (PDT)
X-Received: by 2002:adf:b348:: with SMTP id k8mr4168232wrd.157.1590676278150;
        Thu, 28 May 2020 07:31:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590676278; cv=none;
        d=google.com; s=arc-20160816;
        b=RdPLrChQiu/7W+AxxqTg9yqDCuP8fQwlz1d1qJDwtYRwrLtkZDmvTBHYmOeqX5XcoJ
         kuT6cqnjIBl0Lh0lacsTAJ1il257ePufBKDbC0cGXPdhcgqwjn5lTGOO5K5ar9xXRK20
         maxJC/WG9zQaegFR4aXqvGZkN5yajRqO5azr+Rc6Y2ptYWU3hn2DhVNhdpTKrMOLX/lT
         NpNKpokzbCyxPMjeR1DLsdiwqhMbqAOEwhAlqnFRxzzGkCjbzQeRbfMFZyLxDurhw/VG
         FtVxPBbYSPXMvW072q16v+w0UnLJLxpX1eFcbv/btBjG7rnrq4A3LQQWzdYDuBKq+Vyf
         t7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=byBCNud7qPkzoryI3N8gGZBQbTEP36nDiQR/W0V36l0=;
        b=eDlfMxfaVOf6GdiKpzhKHOnyBpFvgcV9f0B0b6wq6WRYjwBylmXiXv+n87UVZTUOB2
         2XFzMJ5ywqjBettAVsouG9qWm9JbVOAugYxkGT3kVn3/Dd6xvUp8HgsnnXf1vToyJblT
         KmWHOVzDxRRUr1f52rUpfOut7xNKeAjyFL4fI6WG/Kf58KyP/LdCmmDicSt3JfbEvDT0
         hGUEQboeDJHj8LNR7OFAOQoAhwsKsNzzJ6IyeyuPZuui33lNm6OOLgD9cxiQq0mX61LU
         RVTCeguZv1mSx0MVQnOalU9jBH3+YaiPdSJ1Ubc70robUNphAV08i28fMF+GxAq/0V8P
         lA3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AIgfweJB;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::644 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com. [2a00:1450:4864:20::644])
        by gmr-mx.google.com with ESMTPS id y65si254443wmb.0.2020.05.28.07.31.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::644 as permitted sender) client-ip=2a00:1450:4864:20::644;
Received: by mail-ej1-x644.google.com with SMTP id z5so238863ejb.3
        for <jailhouse-dev@googlegroups.com>; Thu, 28 May 2020 07:31:18 -0700 (PDT)
X-Received: by 2002:a17:906:2c03:: with SMTP id e3mr3205294ejh.206.1590676277887;
        Thu, 28 May 2020 07:31:17 -0700 (PDT)
Received: from localhost.localdomain (static.88-198-216-42.clients.your-server.de. [88.198.216.42])
        by smtp.gmail.com with ESMTPSA id l11sm5061411edw.55.2020.05.28.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:31:17 -0700 (PDT)
From: Mario Mintel <mariomintel@gmail.com>
To: buildroot@buildroot.org
Cc: jailhouse-dev@googlegroups.com,
	ralf.ramsauer@oth-regensburg.de,
	Mario Mintel <mariomintel@gmail.com>
Subject: [PATCH 0/2] Extend Jailhouse package with custom repo option
Date: Thu, 28 May 2020 16:31:30 +0200
Message-Id: <20200528143132.48501-1-mariomintel@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: mariomintel@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=AIgfweJB;       spf=pass
 (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::644
 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

This Patch extends the Jailhouse package with the option to specify a
custom repository. This adds more flexibility for customs
configurations. While at it I also bumped the version from 0.11 to 0.12.

Mario Mintel (2):
  package/jailhouse: bump version to 0.12
  package/jailhouse: add option to choose custom repo/branch

 package/jailhouse/Config.in      | 36 ++++++++++++++++++++++++++++++--
 package/jailhouse/jailhouse.hash |  2 +-
 package/jailhouse/jailhouse.mk   | 17 +++++++++++++--
 3 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.26.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200528143132.48501-1-mariomintel%40gmail.com.
