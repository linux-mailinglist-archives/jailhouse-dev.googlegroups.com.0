Return-Path: <jailhouse-dev+bncBDXPDIF3WYKRBBM4X73AKGQEFKHDWMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id B830C1E6441
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 16:43:17 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id t3sf5032424lji.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 07:43:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590676997; cv=pass;
        d=google.com; s=arc-20160816;
        b=GPwTP39xrznhGt5VJoIU31m91sFa1dklBVeD4jSfIaJkoM01Z67UDzLoDUhczEqSxI
         kd8CsZ7ImCzVNGhN3lQriGLVOurUy6lsgpmeqH4ZQwfj6WP6QDmGiodUWtea57vWBoit
         ITmQI0EZZvMq3NW2k2nJ58Tsb1CDh012uxS3lLgMy696OafkbKaBjntW0XgFeiVZ7Pgm
         P/5GBEh0rmu3GlVNffqbqiipEuLZJkXf0JrpKTnMHUrkyIq8I+JECO3WasC6bWbtmOoz
         Ds25UtoqscgJyOLBJ/Soq623SRstf/W5UK4ZthmN6PtENAP/S/t3i+JyP1TGTm+kFN9X
         Abiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature:dkim-signature;
        bh=97Cc350ThVKuTwJqTeJ5p6iqkIU4Pgtx/2ZduU5V6xU=;
        b=OPlQHBg8Y2kJqzVj8vzN+iLj1dSKkzjN5xI/47WyYFuATdu7edX060rGQ7NyGKRUnL
         uDN3iSiB7mCrt4cigJ8T5cwWd3aPXW5TqOUZQyoj/KVQ4C879WKyI26/03Rmrhd1Y2gx
         iCe1UMrOxpyorGHkBsL8aDdiiF6S+Q/RRlR1GGDPHu1Fhnhill/iXnnl7C+Cnhm5IEIn
         fkq7G7nTn9YyH7szT5vEQTSB3E2nyQ/yJLLNeaQaNj9shIkruLJ1kz11rUl2wbSZCcUf
         w5wK/bOGDDR/GFzFRpc9xgKfQX0Ywf1CSIf49/ok0k2H5jLZ5y1dmnq5LjiV4Gnimtvt
         M91Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=V99oVHzT;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::641 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=97Cc350ThVKuTwJqTeJ5p6iqkIU4Pgtx/2ZduU5V6xU=;
        b=aTpk0FSlHAsgV9MHepbEN6FKUJByOYvKYCaIhFv/s4nERI7em4iyxRWz/5dOPhYZtd
         VDV/vGL7TDqomz0/EHjeRVMnJai14+tY1D/gM3z5RNodT3FdkUBLygJ9z+iaGNr9uOCL
         tqN1cezPcvAO6SUTzY6gXz1C4gZ0+ROrfDXyFA3jEOcbeAYPgw4ybDufwlbgn3cM9B0L
         YS+WzF/EByGn+ibH0vkCeoDkCtiMacHfDrI8Ja5UTyLAaUdk2RaunyGsRD/Q08GTQ/8J
         tkm7PnjnMaNMhKqWmEjPySmIswAFAUXQoV/yx4uDMcjEROd5i8Fg7fY0ujFud+ioIJmg
         KRvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=97Cc350ThVKuTwJqTeJ5p6iqkIU4Pgtx/2ZduU5V6xU=;
        b=jwNRSJFWZPQwCWsPlO7tU2vQpvJpYa7bXibyPQ8+FTGqxkHKw8L01UluR+kDx9IG+Z
         jjWnPOSaM9ANtpZIo2rhLsuc6AK9xjU1NlGBsLhQVABYm4vQnlRtJ1v5wpj/75dqwbml
         kftW2WxF74+Mmo24tlkEbNUQegJ4uFcb/vB14fQnHzGriCvM4aX1FDuiq5rzWW9uBTXH
         OflUI4QMQFdCwvojZwqnnxS1fSD9E4PPX1AAcIGWSRI3iQb2hZvzPlngnNGomZK1280/
         fAk7c6VoRvHcJZfL9da3q4vE1JRnxRhOJ4jx1XKs71izWG+qGz80DwW3Anwfi21n4k2E
         XraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=97Cc350ThVKuTwJqTeJ5p6iqkIU4Pgtx/2ZduU5V6xU=;
        b=ZtZ4yL97PC5z7Ig8wwIMvFaTGC7r6kj4InEK/Yk9v8uHekbXL1ofFpvUFcWMgY1qvg
         yzn8dsvmFId9+huKEd/izsVmpECwA5Qx+CZ3w6dey7Hc9mIDNcT4f7vCxBsjw6vYCp1A
         SoOR9DgUSwVZtVkUt4fAwpHV2hOH4T02LkynHEE8YdvIwyRTPWoAV6yucnG0gydykZ7d
         KIpJodUoPp8QQKVTvQOGPQ3CzK/Wgp9PuX3Gx/PQVuLekonyldY06GUjdNQ3jllKnX3M
         bGxQzN3ZiQ0TPzOJzpFh0xtJFXFTnArV/lwXybpZVP+4zA7kFPb3YyQeGp1Psa8y6A/T
         qnvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5302QoB/ALJL+ni0SKAjD3TuQoUKrZfnijcJ5tzW31eMst5SalMX
	W2tNEN70013fHGZFZgZOsFo=
X-Google-Smtp-Source: ABdhPJz4BDhEStWP6Oke5vuJrsUCPMDoDHv3LtS1Vg7IOLd3Ofqq1C2YBezFkAVKBKVGw4zGVsH83A==
X-Received: by 2002:a2e:83c7:: with SMTP id s7mr1751712ljh.68.1590676997258;
        Thu, 28 May 2020 07:43:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3047:: with SMTP id b7ls481805lfb.1.gmail; Thu, 28
 May 2020 07:43:16 -0700 (PDT)
X-Received: by 2002:ac2:414c:: with SMTP id c12mr1847414lfi.47.1590676996574;
        Thu, 28 May 2020 07:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590676996; cv=none;
        d=google.com; s=arc-20160816;
        b=NhNYnYCjuRmsUz/AmFfD6dVK7aJrWNuGtsYYJnUQ3QoaVtdhsZaioSdBCGyiFiYOS2
         U+bK3EDTwyM7Q94RT0hTKuG2ftI3fENulhLM4wxvemmFyQMKkSFEEJiThyqYyaRlhU/X
         OEyw4RD/IE3vD2aFdgN1yzZOcPbjWH13N8zDc3uEOtjBepzb78TRN/OyI1OMFIbuLKGK
         m3r4znlodzJPIKfDM0nSvVhyQS0NWrZ1BMRHq9srV6j+jbaSTpp2HnXDtADUBx3NZDF3
         pFSRwV5LFO57DshCzbIXzij8uMn4lo+FyH7Vdbcgr8v+rWrhMz4sOoBDgtY3ObqigTeS
         Zksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=oXdLUjLAZ9OGXmW3jQqropKZajfmfv1y6N5eztXhMV8=;
        b=Z1YShZ5ofc0a9aagXCHVd9yOTrNJ5igXtg6GUn4W2u3vK9uJ4hlaCxejL0Vp/1QjK5
         FsqpfhWXmLwfP2dhOaZPqu76gVPPHWbFkgKbo9PBdfdbYAAmtYTfAKCwIqCJHsnEDoDM
         8xrrvHrOoW/iqgXvLq++zydnfk2oFRoCcgwmAYCBXRUqf37G5vXSZxsIIAvVjmLpq+Gy
         agt+kLTLFCMnHZTazODshSQJergVFPBRaiPhyWVPvt5abD+fZGvVgVWBNaFNbpHrIqOg
         M/hA4MRQe9wGwse+aensXo+edUMunutJw0bEvkYRYE26vhFKFJBoaxnnPW5DPbsliMTB
         F77Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=V99oVHzT;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::641 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com. [2a00:1450:4864:20::641])
        by gmr-mx.google.com with ESMTPS id 130si300605lfi.3.2020.05.28.07.43.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::641 as permitted sender) client-ip=2a00:1450:4864:20::641;
Received: by mail-ej1-x641.google.com with SMTP id x1so250564ejd.8
        for <jailhouse-dev@googlegroups.com>; Thu, 28 May 2020 07:43:16 -0700 (PDT)
X-Received: by 2002:a17:906:81c6:: with SMTP id e6mr3211566ejx.241.1590676996154;
        Thu, 28 May 2020 07:43:16 -0700 (PDT)
Received: from localhost.localdomain (static.88-198-216-42.clients.your-server.de. [88.198.216.42])
        by smtp.gmail.com with ESMTPSA id l8sm1710147ejz.52.2020.05.28.07.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:43:15 -0700 (PDT)
From: Mario Mintel <mariomintel@gmail.com>
To: buildroot@buildroot.org
Cc: jailhouse-dev@googlegroups.com,
	ralf.ramsauer@oth-regensburg.de,
	Mario Mintel <mariomintel@gmail.com>
Subject: [PATCH 0/2] Extend Jailhouse package with custom repo option
Date: Thu, 28 May 2020 16:43:31 +0200
Message-Id: <20200528144333.49268-1-mariomintel@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: mariomintel@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=V99oVHzT;       spf=pass
 (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::641
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

Sorry for resending but this email wasn't subscribed to the buildroot
mailing list hence the last one was automatically rejected.
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200528144333.49268-1-mariomintel%40gmail.com.
