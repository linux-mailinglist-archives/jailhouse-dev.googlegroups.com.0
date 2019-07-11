Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJHGTPUQKGQET3LSSLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C2565327
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:21 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id e16sf1280342lja.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833700; cv=pass;
        d=google.com; s=arc-20160816;
        b=vuluVWCcG4UD3DsCkSBBit5FJuvHbntBxzcU2JYrQepw4Q2hT/3xSbwQnT/LWIbVoH
         cKNpUrsj/1JDAIh61Sd8H2ps3qCG11e+C9alIezi/72kFL6f1ErvElsb2dBkKdXWCfpN
         z+ojviJQwJXDqGYv5kgwP5RlFCh9oIZKUOeFF1Xhyaocm3xR4tZl5p2TaySPl1K2HNul
         Q3TlL5nOc1whqkBxLDyBEWrDFdTV+3lotsThLYiueOwon1NyNeQg++wama14WXtRpC0P
         PRTQymx2BNSvta9hNjszcjJXizch8Bml5A+ik25YnOqpIBOlcCbtrxDOLkxkR+8KlNdL
         6+kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=uCugsTsKlQxRUpfSWQgZ2fX81b6w16+aGTl3SmepKAI=;
        b=mBF/4zheTT9uTHozQK8BXmCwW94vlphrP+j+XunuDixW4JzbA+yd4sdeWAVlAAiR9d
         kkB0mi/jMHPuY28fwA+fvFOwaGBF32BiA4+FdwhBEAsLfZqrDTKqN545lErUxL91jldK
         +v6FCCpfM2LiaGfgCIVBdutjoYawWU3/zpvqmL7xNqCL0qzeKXURkYBU7JDnpiHOGid4
         cx+xWTs9qIBR/AFqEKFWIUIxCGJF9P1HAhmlO9wQzaIcPnf55941f1An9VX9Jf+1vEzg
         2Qhj6LvHaq6qyjkqLH11UKEyflR/Uer3LfTda/0ZerGLYcUirWC1BbVhAI+S/GHb1Our
         di1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uCugsTsKlQxRUpfSWQgZ2fX81b6w16+aGTl3SmepKAI=;
        b=tMuB+SXzkQGggLO00lAEuH42G0kQ44RJn5hXIYwaG2yxwtdO/rQZFB870Suf9LOmIE
         CHdEAH61hxByOyYnV2DXH5eo3yn6Cghz4OJEHyvWEQ7MnON7uNSoGwPzAKEuPozVQDI1
         Fk5b4DyWt1agALpLL/6uj9MQFc0E3kCf3Tt37+Pheuh34Hr2I0KxYwoHKcBPRrmEw/Kl
         xhfHBug3QAW9VJZ2EfER8LNYcswdtrHdPVomBi/8TnM8fYdw9GELJ5CWb2yP7xyuSgNU
         RQdJae3m/dY3Xq79pLNFV2vuRXMM8qiHmVB6dx0nAUIXY4JFL2xnq98JBeh7+iIeo649
         Hgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uCugsTsKlQxRUpfSWQgZ2fX81b6w16+aGTl3SmepKAI=;
        b=DGhDYahwDKLQ1tJ8jqAvpLMYNSgi2VWBLXoUNWN7ZCnjHQ2ZscZ+9zY2+0G3LHMu2R
         6iHu4HN5+rpufFnmrmKS9+Bcx4ZJmsa3AVYtUXnamiehWu2j6GLbiItLgAOxgBSML1Av
         tuSJxdMznEnNBumFSUznmCMsBUX2R+JSxHF5ygwCTmC/Vqs4sE7Hv0iYwk3IkiBIgj0T
         g2jv6YMqnplONu9/RdfBOBULgQgL9dR2BMqufI990hOY+05HGKnDb4B2T6XMzrIBd6iV
         wbnesUBJsrkZzb21V9BsnWJhjdH5QRwH4jglKPDXs8AyaZLP31jyVdVYS+Jklj4wmpyB
         42aA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXdlj+HISRoWAe+2+d67FdX4yoh0tjDXlryql03yvW4l4P/csBM
	1NvHeUgVae6zHdtey9FhrFg=
X-Google-Smtp-Source: APXvYqwseVthbKZpb5+PaPjNobF9XIxDE1HRoH3O+Mj5gZgla8rZF8aqa4limuuNM1EK9JVjhCElZw==
X-Received: by 2002:a2e:5d92:: with SMTP id v18mr1679637lje.9.1562833700668;
        Thu, 11 Jul 2019 01:28:20 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b601:: with SMTP id r1ls620335ljn.3.gmail; Thu, 11 Jul
 2019 01:28:19 -0700 (PDT)
X-Received: by 2002:a2e:5dc6:: with SMTP id v67mr1677033lje.240.1562833699973;
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833699; cv=none;
        d=google.com; s=arc-20160816;
        b=L2ssmEdb0l7ElNJ0gPR5KZWfL8+/c3YcWHedjgxZyJIxKqJBw8FPgdOMQKO8OQ4P+i
         GZGhT9VJoFuG50MW3AN3lZXPZLySpa3Seqel02kUriRaRdcfFuAkqSkE2Fgky09I91DX
         SIXlY/FNRn/SxEEcVGm4CZoo3dxeor1/DQ1ukCOotYW12HGA0I9gFZbPfW1r/SbZtjEI
         JwhyLl9pjFXz2dP08RJPDJRVWPI8rNItNcADzQq5IyFhruw3ZT32pMMnAHxnOUVer7u4
         DzEgwKLCUeSNqbsZo9OdmzTLQTyttBiRDSLUpN66fT80B06bxEH+1/XzLGKZxbTMXQmm
         xY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=B/9Ue9CzSkZmzqhPGOHZ9jkpiITSb9rJdh4XOX2yhSg=;
        b=sFZdmFMGPK0p3hzwQ+MFlwGs3FmTFAyGzDenkNzC7Co4wxtXFhjBb8xLbZMSQLDIxH
         d7F/aGqPkOGhoqxqis1Cm03zp+HtgJ40QvtPXNc1MJ3OxlHHfO1bDokepVQtfiUpl6O6
         TVqsRFA56JKp7wid6D7hbztDc07qAkykxf92OIOs/AWn6SmwPVdNIBtSsr4mBwMMWMNi
         3oAnQdqJKuzJyslPVGAjGc4SVYft0h9epoMC6QQXXl5HfyTJvo2dlWUmVgqgJYfuRlzx
         +CvqwXERK4rcU8fw7SXVlSTlqN0lKQKUKncbFXbxHhtrclHHPdH0kFMCNDjdLnjeu/SQ
         9yAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r27si267151ljn.3.2019.07.11.01.28.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6B8SJsq009598
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:19 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7T010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:19 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 7/8] build-images: Remove no longer needed losetup
Date: Thu, 11 Jul 2019 10:28:15 +0200
Message-Id: <1b3e8082a527ef65459a94b90e93db9be8fdb3e8.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
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

Since Isar commit 8b8a339cfaa4, this is no longer needed.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 build-images.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/build-images.sh b/build-images.sh
index 7699c4c..ec4d6a9 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -111,7 +111,6 @@ docker run -v $(pwd):/jailhouse-images:ro -v $(pwd):/work:rw --workdir=/work \
 	   -e KAS_TARGET="${KAS_TARGET}" -e KAS_TASK="${KAS_TASK}" \
 	   --rm ${INTERACTIVE} \
 	   --cap-add=SYS_ADMIN --cap-add=MKNOD --privileged \
-	   --device $(/sbin/losetup -f) \
 	   -e http_proxy=$http_proxy -e https_proxy=$https_proxy \
 	   -e ftp_proxy=$ftp_proxy -e no_proxy=$no_proxy \
 	   -e NO_PROXY=$NO_PROXY ${DOCKER_ARGS} \
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1b3e8082a527ef65459a94b90e93db9be8fdb3e8.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
