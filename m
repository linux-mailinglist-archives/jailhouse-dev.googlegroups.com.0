Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKPD5L5QKGQE3VMKKNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF63283022
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:54 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id v5sf3570772wrr.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876394; cv=pass;
        d=google.com; s=arc-20160816;
        b=nS/3luFC3/+Rsfq1iW0foPGctgoHfIp00LY42H6Vc23dQvKSrRa/+ZFUujINrMgklg
         HWzVgFN2i8YMQaHIBK6OsqM6TR4EuoVzFoR33RCj/WUfb/LUVEp0wpWGnajVBbKu2GX8
         ON1aSosSq7fyNSGXhu0qNuUR2aKPdjMA9/wVD8GlaQWXfsXYxCVle0V9Uixqu8rKhcry
         /OP+04gfzZTlgpI3fmFeOIfYJuKVAHCGXkrJMAORTgHS8XWwNuMjGewt5p5GM4BvDOqN
         RhbETgAFzCQZu1BJPy9FIX1hpT4kH1xmO5WD928jUpX7XpfA19nm+ZGQr6hpkWrofxBU
         Q12A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Bo2M6+EpQuLAql3np/TGjIu8AigxoSSLuo43IKduvp0=;
        b=C2l3wL8gwZCFyUxlHtdD97EXZ0H10AWNRaamL1j2jRs1gRHmcYmIoIEFEdBaa3nUhP
         mZ0HDSQxy++r/CZDG7yclw0Vix6VcH3aLUcf9j8AUyWHxKSCH7+PpNWa3doyapYQ+mW6
         FQ/ARvch682hBUKA/KkZ8Vqc2/FBstOZd8DIV/mpiDF1k0uti/tuNrS85K7FjSqQNxA2
         zlPVLa+IUI1TLJ4pb3Hev7G85a70Jq/5wPWD9aYTRJCx1wlFs9qe+YsW8Iy+raM31gET
         bKo9xDImh54bXdZ5QzrKhstBqruL3WG59j0BIGQqxwwvIFJaeK8h6rUe4AhlN8AsYxLO
         6gww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bo2M6+EpQuLAql3np/TGjIu8AigxoSSLuo43IKduvp0=;
        b=eZQ0L9heo0JFI65hTVYAEogKF8fDsRre8vnTlrvLzQUahrvYacHkH/mW0/XNaDqyff
         tXdTt8ayi/jsRC1LgJdBvXxWNlDmM2hV24F14oSrMcDM2ixdiMfZrWVsjMGXKRyIG7oI
         BPyFAkp1Yov03PZCcRUqVZcZk3lD4aGtdDQnfvvf6VXrxD8bbQHQXNtfw+Cx04/1aKtt
         fmt4VVImHSmbNJ8skMQApw55ylbwaL0Cj/Zs9nBaNWoSkWDmdx0iVyAFvNZ5q51epWux
         aIGJkH7SZNqVuYHtjLZv7fGKekwzx/kaF0m1mj9MNimpRER9OTz/fLbsi5/RmGOalb+B
         SLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bo2M6+EpQuLAql3np/TGjIu8AigxoSSLuo43IKduvp0=;
        b=CXbODlGvdfiE7MxJjUOK7bvcU7YFm+JB9gQA5XNtQZRin/caJT4pQQU/LjJdNlWZe+
         PmErJcbeRAIgauYqzOpytEMBAlGC876mZQDrn2TRcOYdASy0Z1TULt12Vu9VszKe5Alv
         +5nWHw2mgzs44V+nc3F6+HYI/Ci7i9FPjVHPayEFP3tQxbs0CpzSNNohLtXSZm7xrCp6
         EBSOfUM/T8m96UOd3gy8l7sD/TwHjAm2P6LJ2u8frzogvDQVCFCGjhGbKHQliXUlHso/
         vLeEMoP3K4XNswFjsn4cSEU5va/gJvj1yKyORxP0sDOZDnziEzyJ+wdQzuXqG5G3wKCm
         M2sA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532p+6SZicCEd9JO2AyDqQpSbbkt8cCb22oew02YwhMAD3//0FVn
	32mZlnpW1Dll/gm2VxGy96o=
X-Google-Smtp-Source: ABdhPJyYUePBINnAEgktbwr4EeS4rUc4EPj584jt0pxwO/Mm4/RyV8frIW2v1IQz25Fjl45BpkGzqQ==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr9983152wrv.150.1601876394109;
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e19:: with SMTP id g25ls4094681wmh.2.gmail; Sun, 04 Oct
 2020 22:39:53 -0700 (PDT)
X-Received: by 2002:a05:600c:410e:: with SMTP id j14mr15693779wmi.13.1601876393028;
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876393; cv=none;
        d=google.com; s=arc-20160816;
        b=swu+d0iibY00uzqqgXOAX+qNsCKh5wrVtfwiLvsfCm2tdbPsnM4CdmWF4Ht2WMP0HQ
         4gReofCpZlaXeIr4U2NtEPaqJg9dWUMQmaFdXNBe9Bv+z8aVxNSGAJSRCL37yh725Nad
         VNpl/YKskgiclDsq4X7avJ5yCxtTc3jKahQqdjct/Oxuo9Xs9d0NrfbOBho/P619tLvO
         REKBar49WlO59sm2/BYBGj1LXCsFAH7mXUTliR6RBqAG9RNI1Mfsi7ijPyrzbyharEJC
         wLgyII/ve7GNo1kLIiKIY+2fZv2aT63bCNzUCtB3hLnoBc9zaZNsz6unbpfcLLaFhyE+
         k5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=pzXVWL9rAz9T2mFX8E5VtUb3Fz2hKKgHxEEV5mArtHI=;
        b=GIyTJQ9r99xJd/4JMaWf64xMstcu8smT6JmxI72eqTtltSl4fZCLnP1s/dVjYiGfpg
         tF7iL2bPBQhnjvcCYOxqOGhi8l80p6ALo6AaS0syZYDb5wj/91bx6m4XgmKRjKAHzmzL
         edKoxeHn21esJMbt09liJtVxhgpn2OjPcwzy50yvqGbrvohUz20iIFOfI2vahLqBp/7Q
         xchVZ415kbexKQGcVIsqXxdW3PO635OBX8Pnat+cG9oBaNDT1+yiF4OxCya2/9UKUM/x
         wcCcI4vXUmINXFce2ZKtld1dclNexOupFDXSw4BfXAEIFeEXpT9utdrk4YzmuympQ4Vv
         gMfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id k14si250115wrx.1.2020.10.04.22.39.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955dql9000943
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncG025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 07/19] customizations: Add Ultra96-v2
Date: Mon,  5 Oct 2020 07:39:37 +0200
Message-Id: <4488ff5f990a43433274bd8bb1048ec3de774317.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Identical to v1, thus simple links.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/customizations/files/.bash_history-ultra96-v2 | 1 +
 recipes-core/customizations/files/postinst-ultra96-v2      | 1 +
 2 files changed, 2 insertions(+)
 create mode 120000 recipes-core/customizations/files/.bash_history-ultra96-v2
 create mode 120000 recipes-core/customizations/files/postinst-ultra96-v2

diff --git a/recipes-core/customizations/files/.bash_history-ultra96-v2 b/recipes-core/customizations/files/.bash_history-ultra96-v2
new file mode 120000
index 0000000..61f65e0
--- /dev/null
+++ b/recipes-core/customizations/files/.bash_history-ultra96-v2
@@ -0,0 +1 @@
+.bash_history-ultra96-v1
\ No newline at end of file
diff --git a/recipes-core/customizations/files/postinst-ultra96-v2 b/recipes-core/customizations/files/postinst-ultra96-v2
new file mode 120000
index 0000000..1bc8b3c
--- /dev/null
+++ b/recipes-core/customizations/files/postinst-ultra96-v2
@@ -0,0 +1 @@
+postinst-ultra96-v1
\ No newline at end of file
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4488ff5f990a43433274bd8bb1048ec3de774317.1601876389.git.jan.kiszka%40siemens.com.
