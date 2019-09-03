Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQUCXDVQKGQET7JVKFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 211EEA60F3
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:31 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id k15sf1063992lja.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490370; cv=pass;
        d=google.com; s=arc-20160816;
        b=KFExhtXpYaBE5+st3i+x7W2sQmjAj00gjAUYYSd/Y2d2ACjoxKoNqW3tGNt2zikQD0
         4hrSumdoTTt4nVuVaseRDdesAnU7CIif/rgZ/4Fnt6SyUdesaksLfN1PyVoQMb7BK8Bn
         15mhzSatkugEFn1Co30XbgcL6Np7iTfEQD5lQQvbCrdoJJBZV9KXWPlZTZ5/BIy3rLvE
         8O7I55TMkQi/sRV9ENn52x5oWgUnymZ0YT9p5fLRuSROH4yxg/6zJUvRO65vmmpSg/5V
         BFmAYvrGd938vgeXVPA0jumnY0KFWG43QfVZ76dIZJ6I3dZOwpcjptEs6An3HQOFcQdu
         RkXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=yBY+d8d6ZRWRvb4YPnUiIx0oWuYmboQhp7uy4EIMc+Y=;
        b=jh/xEedPPdk5Oq149MpAioaAZe85iNdL4YwkxNjYrXyHnRy3SMVpdnMmFaeIvuA39/
         HCOKImC4qzH3upPb4pfo/IVqgX28OanwllCOFXH4vijt2XGTPVEwiZ7Bq1ApZ2aFWQHm
         5/1m2Cr0uDrSju/J4nLsbviqRSynDJh8dcIc8tYpoIBjmAonzFz5twHBYSDoMVEYPGjF
         LyZGIPDJxK38ZzKEA/iqu01jnpOviAD8tWkH+FlpeecjXFrurMQUDMi15uXazF3KWot/
         EIV2dR3bR5sqsWFcqDw+anPIWklTZd+5YR+3And5OXYwHszRfG8jBZHPMsVCCQyPpuxZ
         hA1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yBY+d8d6ZRWRvb4YPnUiIx0oWuYmboQhp7uy4EIMc+Y=;
        b=qmVoNJhpOfE6XOkdNADNGFPeiPksvqO4k8Bjy6Js9oSQXFG0iKm6ExVEzRV7i7l8za
         N7/1Pavk0QY5wRQhEfU/eTyeBoQimXlVTBwFHpjFS1UO7K0bN89OR10Jy//dcwkFYSEq
         jN9NXrUqaDw8HR6WOLmWEfdyvw1HVbxfDWtnFtHLrNkZZnCqV0uMQooo+5ZfDaM1s3cB
         WkwznHtIKZGH9KP+kMEJQ52jFp/Vt9LnDfqRLlXUfgmuvbgs/MMrQE08ghb8JkypN35s
         b3g8cZwl9e/mBVFz37bVqtT2m3xm8wjZrYpW3IK6wxVaBIADy1IQY+o5ia8bjqdnZ6y/
         mTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=yBY+d8d6ZRWRvb4YPnUiIx0oWuYmboQhp7uy4EIMc+Y=;
        b=hhulIFA4T5JVxGX6gK021G1ueB3WffxteJ6u3bW1JQ9neqTXUsOUTRYUnXuGVNg7yf
         KI3uoZLQUvGm9aoT8hbJeiCW+F2RTimYkJ41Nt6DkTOL6Xs1Fy2DT52k+h3DLGMPIW/c
         W+nk6jFsKWFL7IHMwyiFKlHOvThqHwf6j5lL4rT6uNW5gIxEhzzGblzy5oholHJVVX9i
         090vQ8kaNAzBOhY+d81t3McTMHHavoYzD1bg5sfkRTB2SWktg4JwE0ttzPMWEgRnIo1t
         NDlrNqu/X+uMSY9N+vfFK8bXNnWUOR7HOI1zPNjo0kAlvo0sF/X0ebSUOblcLyc9Beoe
         J1BA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW56Te4nOnPvH+De8ul0wImNN28LYL05v/Clt4apx668fZ2rQeO
	M5boCzF16LssTPcNf0wLWRM=
X-Google-Smtp-Source: APXvYqzubzb+SLMMUDfbxOz+Mv7sr/V2p0wzNfwdz4MSI2jHMfKJC1EtgJmtVAcYtm/w9EMYMLu7xw==
X-Received: by 2002:a19:641e:: with SMTP id y30mr4092838lfb.148.1567490370766;
        Mon, 02 Sep 2019 22:59:30 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9f16:: with SMTP id u22ls1755087ljk.1.gmail; Mon, 02 Sep
 2019 22:59:29 -0700 (PDT)
X-Received: by 2002:a05:651c:20d:: with SMTP id y13mr13358219ljn.112.1567490369884;
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490369; cv=none;
        d=google.com; s=arc-20160816;
        b=AiGcLGpT10HN2Vb/MxYhPdMWBNBANU9n5yXEKNW4lOTzhxRhZLW3RQ2O3rkMT0JxYI
         BctSzt21IBnmUwtAB+E4egFt34qz/GD9B1ApldhmV5USaO58x+bPOGrWIVTEZ7n+VZgu
         FTiG5gjijT/1RGyxwHNjSDcRa2fjCHQNoJMgR61cU0xKkLbAzkNU1Wde/u3DXJ7GMpQH
         TPNPISJgzIqGRbAjdreLjLMFSKA1T35xnyEG8CX3v8tyvTEN1UBVULGo/1orwNm31rUr
         9NTM1h+fTZt6A/ryDPk5npTo2p8W3l9v8kb/pAFUTOOJFYXXRUquQMDJHczcwqEgaEeI
         RS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=WotQWxuMRpSe82p2WbfIfQslyLfq5RFrVknTza3d74M=;
        b=r+so1m8EVVuoAFGmMR27JtC2f7b6xshIl5TKi5tyGN3MAqmGQRhLH0vF2jOV8aRbBf
         GnM4mYz9ov2plfMvg/SRZX3N7UJn75MObz2IFWLiLeOId5LGp/7B8xzm9MBm/IdWoSTd
         0UpxI4WZ+ia/nI4W1pj1SsuPFV8x/gZF6mQAL96RqLS46iHbG6rBZ5CpaPdL0bRp0xeC
         9iegMwfAhhWTzohUoh6YDQpE/blhjF3vzTBHYGJ2j4MrdmoebHI+1DyqvJQA5e2PB/+6
         1b4WLTQgKvVwvwsWlZFI7LDrcqosedjZP47TD8r6m3vF/72++jCWyF/H9jAnfMN4vGy3
         jS+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z20si306199lfh.2.2019.09.02.22.59.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x835xTIO020240
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:29 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkX010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:28 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 10/13] Update Isar revision
Date: Tue,  3 Sep 2019 07:59:22 +0200
Message-Id: <a65f8e9dc7331f7b58faf99fea5a13a40ca74028.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

This moves to latest next, specifically pulling in the machine-id fix
that resolves boot-up delays.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 kas.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas.yml b/kas.yml
index 4ccba88..bbc7e69 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: bdf8d29eacfde381e4e17a9b953328723cd9bea0
+    refspec: 446783f6bc4bc3e96c31da93b5389e391e74d533
     layers:
       meta:
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a65f8e9dc7331f7b58faf99fea5a13a40ca74028.1567490365.git.jan.kiszka%40siemens.com.
