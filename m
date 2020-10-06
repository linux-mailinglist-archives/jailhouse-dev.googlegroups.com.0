Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNHG575QKGQEDPEU3EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1962844E4
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:49 +0200 (CEST)
Received: by mail-ej1-x640.google.com with SMTP id x12sf5256350eju.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958709; cv=pass;
        d=google.com; s=arc-20160816;
        b=H7HLT3tMY4DjwLeCOza7x3GuRhHmkBOHMNFBli829TyAAcS16w3ofMrdm3iQ40J9aA
         zsp+cWa6kGf7c7QdNOj+45eIZlVypWETon9CXJC289kon6fMxF4aFeHLdXSic1eOO+pE
         p2/3+/Od8756ugQ3zYVoWAWZyw0OXL/XoaSsjrvCVABBaJPYfamOw9BgiQP7Xnm4YnoK
         QUErJ1ZkU+o/YzXViwc+EllnGZ/xTZi0e0/XceONH6zMrOgnQBv09PHJ7V8X+Zj91N/q
         VO9I+xCH+Z/H7nZE1Rao5+rKsTdwUsN0+51yO8Hf+5Ulc7dhwmoA7fWPncEhj3+xONgp
         EOdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=3qohbHYUwN/XX0LARQ7+4wiV+2excO+7KTNL69Sj2Kk=;
        b=gDnoyWyAYoCluuCEuNCaC3rfQ3ZMlf0kjw6JLB50PlK/x1YGjIBrOAddhyo91dDkrV
         okguAa24LMVS/olLcPIsQkLePdcsOMFI+u7m1apFfEg8ASE7xBTipqv71iNcAid4oMvE
         7CQ2MkBw1WmiJtlksGoQgxVYyFMqc+8sp6p6qyCfOHnSdbrB1whM+ccZXkEFRnTXH7vW
         ULxzVMdWOnL28Od3rgA8SeBs/OHQ1+rbHFLtM33ESi85vJAZJkcK1e9CMPbt6GkIegXR
         72LDgjpnHCbwrEwcZX0WprzM6E6Af4TXtks7c4sh2jIiGwm2hi1pUjy6fNy4Fim+pG7C
         oSsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3qohbHYUwN/XX0LARQ7+4wiV+2excO+7KTNL69Sj2Kk=;
        b=GZ0sZsOtqMx3UxBDc7WrgxAoeG6smxbfdSM8fPQI6kvocIfDc6CDf6rTIJm0IBfn2l
         zuECS6cAgzlS6QqpY6gwxG7O8Jub/ljV5aevKvMdhNUgDhfOXqGu/kOSPRUHyo1e5YUU
         HUcRU10N45+LGsbb9rTmZ1ffXAwNlUd9SYn4nzfthZc/wWAPTcuE9ZqlfADRUE3O9chv
         v4dkfA4lhiRyOHBpbhlV80H2Zi47UZCRFZ1IAqkGJAl2+DeeqwmyLLnW/koqJT3ReRQl
         PUqeyUDobV2Q9nE5JQ0Ku9/HcQ0oSKoHoRmqv7R1vtGt3OMfNlPjGxnSWRQ//Yh+RRhp
         Efyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3qohbHYUwN/XX0LARQ7+4wiV+2excO+7KTNL69Sj2Kk=;
        b=YLWsVcDwNvZrXCQbCM873K7ocBOcV7FHEOCpLMgcDQY/cIoo+wtYgmLbajdyiQmHJh
         QSQ/PEc7zAuSKAS0lfriiHx5MWT5YL0bVVOTSEwyq2qyLi6VV4jRUfK/bfX5meHfk8zv
         y5Hw8MRwAOww4rMo4Wg7k7hEwoI1Mpun1lEV9d7sw/CE2NWXuqEl1uRZamqYaMVr8/KQ
         GU7BLVkYbq0cGUJmPuypfoWobJCcmf6qt5+Ty/4zHxRaxkKCBWiaqRsRTHLnZyBUza5I
         L/8fnj0wzYU7Vi+RIZ1QlpvRhgzxEjhDulbP30uwvQ2zjUxOCsQNUSEq7rJuPDjEtmJz
         FNzg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532xmb56FnRJ7UyM5zhU9pOi/JpR6QIIsBjOksrpa3giTKdV9KHy
	6c0kPZqI+SnkwqDiH/Tk4qQ=
X-Google-Smtp-Source: ABdhPJwJG485NEliKfdqeu/Gu9ZA+FJ6qKzcHSYouXsq2l2W01Faw6vXmpYGYlfcurYmBNQVJqFODw==
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr3350124eds.116.1601958709127;
        Mon, 05 Oct 2020 21:31:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:924e:: with SMTP id c14ls5360156ejx.0.gmail; Mon, 05
 Oct 2020 21:31:48 -0700 (PDT)
X-Received: by 2002:a17:906:aec1:: with SMTP id me1mr3276031ejb.225.1601958707991;
        Mon, 05 Oct 2020 21:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958707; cv=none;
        d=google.com; s=arc-20160816;
        b=wcsDIr2WeovfNU+41Ynw6ZX9WUAxggsQE7c/DCONJYBo8on0p4Vqi+/H+Xf76J9Qmy
         3en3/hUrXO/sulR5HYYrsvWT6jGnrQTfsPWfeUP6+mh4GtdCWXpqEJwoo8uENMBgDr3y
         bmYvV+nr7Uo2oP+VisFOibnSs+1dwRlajTplCU1DsUAXTFz8pmRS3H0/JLf40Sou4pw4
         kP+4dgA3D2mswmV5sJPcNxYZ335hvoVqJ/vHl+XvCuNnCqaixgPN5vUeh+voMEyAwxT+
         rCD/RHuyVzT2eerOFXrb/q9pshaqLJ+UVp5HrBCJ+U0680AqGoJvTRengbzooadfrQOh
         lsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=pzXVWL9rAz9T2mFX8E5VtUb3Fz2hKKgHxEEV5mArtHI=;
        b=JuUF18zTx2lnSjV+nVFaYvvVZmiwiY6KSYggwNpYXT5s8EObOAM5KuJTNsnHl+mvx4
         SbNpZYSjEs1xTn/gyIeLUiGiC1/eYirR6vOvytxJpTu42RB+3pwB2W9lNcJtPtq0pauq
         W4KX2p1Di54gFSpnL7nIXJRwVfTvpsXMORQ/chLx0ZDX5TXuxRKHFLp0JvyMIMmz9/ki
         8WQXZMZact5QPPtlAEyOZ3NRe0e1u5PAJzXoBIcyy+d3zxFZ+m29V/zmvBVzVcTeCJO4
         sWjxcRmsDk+oZ5uny1Q3ZwbSV1AJJtq8q+7SFvFXzr5pLTu+ALb1C5CaCar+IEuWTuua
         oHUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id v18si60311edx.4.2020.10.05.21.31.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0964Vl2Y029623
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:47 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7r008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:46 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 07/19] customizations: Add Ultra96-v2
Date: Tue,  6 Oct 2020 06:31:22 +0200
Message-Id: <4488ff5f990a43433274bd8bb1048ec3de774317.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4488ff5f990a43433274bd8bb1048ec3de774317.1601958694.git.jan.kiszka%40siemens.com.
