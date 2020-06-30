Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2555P3QKGQEW7IIPNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45820EEB8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:42:52 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id c21sf11366948lfg.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:42:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499372; cv=pass;
        d=google.com; s=arc-20160816;
        b=GXfrorzlYKrmZvECHrY9+yhSfSWj6LZLKaBbd9ixI8LSVjNdZoZqkooTk+2if1y1eb
         CA15CCc2znA4/rWYaIclJsd0q7gAF1ixroEZnk3EhdUqtfgWkEPJFbGsZH7jfnAVJxQU
         VGjhdwuyXVyuz31EXg5vxfn0ieNLgyQy1Md+hS/WUJJVifWBPdIpoF5Mw1dB27pRcsXk
         Fui2Rg2QcLzWIfvOhV/nzXGovlmtdiZ8X2OQnFd0vHVOieAxbVoMvK4XfS5zqehd3SJv
         W0q437kLvI7d/YT0khMW5ks/a0EdGCAAlaQl930OQYOzROOjaWgaUDZth9tZagdHTZ4H
         MEiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=a59uKLqeGuhV/hOOqKfGdV5b1BcjC4ZHAIuutFPHGFc=;
        b=DOb2YR3ouW87SgSHg82YPKd/QXlKFirrSTpQC+zCkT6vPXJLbJrHAeRrtS4278y6wL
         qqlWyIY7ejSpt7jJKXumcG+LjVULzf6O9M4oBl1qiSTcaq8TDEDW4M84znquXOMqKRLl
         g7uoEoB/AYRktom0/acB0IPE+jfPzMgiyDMzgJkIBFE5Vv65htWG3NRVbxNidcMKMHkW
         8srpUUlpkou1rSyE+b1Z4c+qxmE8kTTRPCdnKxlCr+hTLhC0vrvTLu6+lE1b5Si80sCX
         VQ3GBbmhRg48Zn7AUas6ve7R5gBosdgUJ0vk35/ZkGThmLnQTdCYWQSDkaixna4Nnzmf
         y9WQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=J0t+pQJg;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a59uKLqeGuhV/hOOqKfGdV5b1BcjC4ZHAIuutFPHGFc=;
        b=BtJVf3s/fWlRUSrq6ONFfv6DIe+a4MWKQnc0ZZjJheVOH4us6IJj5jyBhXOAdEMcJH
         r1qOg94KN5MDibafTzmR2d+3XnZYD3ZsIvgf9cu0Uby4AI9lWXZArm2IwqYvUFZBJXYh
         CsOjRGRTYqH4Xretn4LUlC0o1ZltvAO7OHJwvc+feKWcXvtQDOuPBkuQvm/6DFSMWRTB
         LSM4FfPvgAIu+srGu7iuAZVNCWxFQoIUqILlykRxKZ8/sK0LoL+MxN938SESju/Elaxw
         xNtG+ciJORQAHj8eqt8fbNez14ITc2cRBT45Z/Enyce77CxZ/vJB6ZqZZYm6IhYQx6KM
         PvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a59uKLqeGuhV/hOOqKfGdV5b1BcjC4ZHAIuutFPHGFc=;
        b=d6XVLYrqHazsH9klkXfdSkjEdHUHJBJ1im7NDIGRPQFM2MKBC9pWcY7ND+UkCeQ5X2
         Q6O1t7T0smeztsTCIKNvgdmWIJCV78FXLVqxrMh1iZJqelzoc4ocErdgb2UmjOI7x/qs
         lWA8MCsE4Sbqcznj6Jae3lqJro5QofRWxJrPVJctdmC47pBM49o/RNmFGvW67+oFM2zk
         W4+puM/5NoQNxyB47L4LZX2+OwRf3nXQc2EdXf0gsgW5KzpXYgy8nGt5RRBmBCVjPuUX
         dJ0SzaTiDRkI8T6aGEt3hycNQoB5Gb1AE7SBYH/i46TDPWLyj5CredDMvnZSSS8JOPji
         l5JA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532q2t2LkUeD0r8L9aHVqD6V/BTsGcD+iWOyI1ejy4M5zZatnA7h
	dDtOCeYjTiNjaVgOt2l/Nb4=
X-Google-Smtp-Source: ABdhPJyp+OBbKg5ad8TNciU2NMNwwQKnyi9EDGwTPpEVJpGS00WLC2jHcC2TI4/xTQ786QorLv59sA==
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr11266245lfk.173.1593499372184;
        Mon, 29 Jun 2020 23:42:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:864a:: with SMTP id i10ls3580313ljj.8.gmail; Mon, 29 Jun
 2020 23:42:51 -0700 (PDT)
X-Received: by 2002:a2e:9a59:: with SMTP id k25mr10400860ljj.114.1593499371279;
        Mon, 29 Jun 2020 23:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499371; cv=none;
        d=google.com; s=arc-20160816;
        b=R0eTB5kDJ845ntHiIYdu5yGILYeg0l7klvnc3xNqLvCwZbp5+R1YyLPQpxT669+aZe
         sYgPTHKtwdqlJyVFnWZTPAzaZea5FrNxG+8GoacUO6WhRVAdWt8bnKO5QylLuN91VTgt
         3ijC4ThVQx0043h6V2us1NAakEP2lwOqYs+W+/obX46OAZDLxi6y3jqQu3VJSTrU6QIZ
         i4SH2WF4ynELIg4gnBPdWv40Ffy2Ujre5GyvZEsvXIML5JwVMTEXgGFe5pPMhpRzxFj9
         9iArs3cGPyQUE8m5bjm6WLxA1c47BvL6hg3zf9Zv/4zTKw6P/1ncuNmAwrPvdWNvuyFQ
         XcnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eieERwLgvNm/r165tR0ZkIKT+2wtUFm7egszPo+GvU4=;
        b=YYxGo00h4Zci8heVzo2uReT/K4afawY8Z/DVLMHJRLw8D/ARehuXWY5FsAqIWIQ7Pu
         WLHAhWd+D7sWXCXgbvk5x9fuxeXQwzryDZ2DmA55jww0wEynM9zaMrA+6UCtRip9AoeJ
         Z1aQ8bf3e6wD59Ys4279/A9YAQEdO6XEj4EOOTeUqDzdLXJL7EYSCPO6HAuxSzKoHSJ/
         dvXQ71G4+GiFAJY0nz9dP9Zwh4WyxLwodxoCHoONxLD8jNxV58qvdOgZ9MUU2JRibAPK
         XIqHuCFLe4VU/ZcAiF8LFhzu83X3ykJe0OMLc5N5sJqR/DATD1xfv0qyEY7ApMP0dQSl
         Jx+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=J0t+pQJg;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id r21si130224ljp.0.2020.06.29.23.42.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49wvtf1z8jzy00
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:42:50 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:42:49 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 06/11] pyjailhouse: config_parser: strip tailing null-terminator from cell name
Date: Tue, 30 Jun 2020 08:42:26 +0200
Message-ID: <20200630064228.4742-6-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=J0t+pQJg;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 7b4872e0..a45aa7d7 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -220,7 +220,7 @@ class CellConfig(CStruct):
                     raise RuntimeError('Configuration file revision mismatch')
 
             self = cls.parse_class(cls, stream)
-            self.name = self.name.decode()
+            self.name = self.name.decode().strip('\0')
             stream.seek(self._cpu_sets, io.SEEK_CUR) # skip CPU set
 
             self.memory_regions = \
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064228.4742-6-andrej.utz%40st.oth-regensburg.de.
