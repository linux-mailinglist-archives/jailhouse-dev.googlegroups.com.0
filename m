Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBSGX6PXQKGQE677UDPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 086DC127F87
	for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Dec 2019 16:42:01 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id 90sf3920689wrq.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 20 Dec 2019 07:42:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576856520; cv=pass;
        d=google.com; s=arc-20160816;
        b=JTB/hlZVIWmOGVRjqdQwcw2/VWAdoG4/JsL4qsORITDe+ccSBtoOevD+3hS4FRa+Ci
         b11D8jvBA1HOyBkf/ucOl3bpFQsHpCnjkKMeCmvLBlzBWK9HtGiqSO13d4EZuIZkWqlc
         MowGAPM4tpT7/Wo99j+pjg8RkhuDCXpR+z9TyCt/vEZ26KhlgLszz7IcY9tzAqHeQH2T
         SDxF7Glg1XX0pJiRy2u6VG7w7D+slAMtdpsIN03cqvZFAnKPat7Pbwp+mlN6J2unNcWf
         bP0G13qfLDdpLeGOR1fySbhBckXQIL0dsledAKo5J+1vcRunLocOOjgNLlATs/9rZCkX
         Zhpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=GhVqq6YKo7PCi8H2e/bk8/qfkny3ytqqP/wwMMc/FrE=;
        b=GXdJX/SRNQlw7ksG8em32YGOOkXAG72PwbLzweB/GXAXnKng2JoQdDVw61+c8qjQGY
         eEMiuc03nRNdWPQsEIWJTOzxHlFKw7CLmJuMc4dwcGRjnFVCVh1FjAxs2oBHND97n240
         NHsAXrPdwBK/10NCin/llat9E4/T69pNy8js2GEXHvHFecH40ozawD4Qy9InZdzMlyaQ
         19wL0lY9JM+EjjwRHfKinAbosdqZVXP+DhTioqpx4y6kgfhAMZXnjcqEcwOk71V1izr1
         t0IPnBGXF18zvTNDMw9Ro0+KkMPnM/8FGDTOAMHIPTdvkHUKpnWgiIcvdzGQcQ3/CJZM
         P3Kg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=QUHQVS6i;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GhVqq6YKo7PCi8H2e/bk8/qfkny3ytqqP/wwMMc/FrE=;
        b=Uft3hsGF+lL9Ea9H639HvNNd55g7IN5vZCPFgBTtcn/bR3RIZ/1YqFk78nZ0QcbOU2
         jD+aRXMwqxY9C78F91D4bZalRJZnVZxVEJ2P5Mo3iicmmmfsQFYQ2wfbMJorDxc6D0fy
         aU1kQjVHJtKWDLs91bDgz6guBjscWAifAqSw/qv+5vCQSvX8lf3h36njOOQd2y40AfXM
         lTagTai0+PrM950wiG1xj8NvE1daOobg3iQdz3i6KUrP4DBVWE29dmTFb4mxRdUn9VyF
         34GRaMxi8LHib26de3QJ40euVFUWvMCVaGHo+ub6d3ITv5+T0bjxDawjBn9TlVzBgkE3
         C3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GhVqq6YKo7PCi8H2e/bk8/qfkny3ytqqP/wwMMc/FrE=;
        b=bdUvgvR9qpehFxzmH9eyxoLWa756xKk6GrCsd9VclQ2qH836mRoWj3C/PZ+RtnVaZq
         +fKLFZ/5CoDsCcVw5rouqBYjtMleneErPhHUgqfAsFPha1RYf8umq9MDvpqSFAPKdVRc
         YfszTQmOeo39yN7lb4I95Y3Yf3KqTC7vrDXk3P7Pjeqh38/XkJ4AoiTqsBj1KedR7uFL
         U+11d7aIoOJAD9EdsRETrF45twscDc//CdTxEXU5ctUtZk1mG06j0ZlaEFYBW74k6mkC
         HnOeYBr9a0gd9ciLz5zW0lIjl70M+IrrIMILS0YnKJIuOCwusv8FbvLYM1agItGD/eMu
         qP8w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUAY9vwsVULGl8ufxG8BO4eNAGz/k2PMGSL7qnraQ5Dn9INW4iD
	EoCfVjz24MQHT47ZXuSW7aA=
X-Google-Smtp-Source: APXvYqziBNWbNJQmwcPJTUJpfrPX0N6lh/D8QCR14cN+po/dD8qVFd+AvGgP4zoGPlGjauVQ/vqv9A==
X-Received: by 2002:adf:e984:: with SMTP id h4mr15612737wrm.275.1576856520604;
        Fri, 20 Dec 2019 07:42:00 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6912:: with SMTP id t18ls2568312wru.7.gmail; Fri, 20 Dec
 2019 07:42:00 -0800 (PST)
X-Received: by 2002:adf:8150:: with SMTP id 74mr16186075wrm.114.1576856519999;
        Fri, 20 Dec 2019 07:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576856519; cv=none;
        d=google.com; s=arc-20160816;
        b=L8b/UK0DuKPerfE35qG9mAh8UThtVYGROeWuy6gm90EdtAqwibR6rW9XDc40ecbdFF
         Ly8rlY7YcKi1dDtgzDfeZHbLshGC8HN0qEBv9FflhNb6kHvhGd1+FUCBcJXgBz10vKyb
         QHGtghOEXfXqV2iBqyjFe7xl8hdjUh1sE33aog9U/6yQiQrH+OAcfq8aSCj++8+i63+r
         kxh1pf9rsZ1cYXzLRT5R/4ao9ms8lPjWTZVzuq+UF14AUxAIatdu5gUN4/VxQkXzmzR2
         92IXy5ua/zTuV7u5Ds9t3hziE9+6vCOabJ69J03sSrNYFK+BbPycRrbxvDyo0XTIPpn0
         hpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JwAr42x4np7gFNadfhbfHS97YKvE6Q+B/MfKO4A0y6c=;
        b=RewDsJpZAYM6G6NyE1dU5KHrMLM/r6Zr6gNfudpW0oSu5QChReILdKY1SveggTptHW
         FtPbEJaHSRXFLEbdAYKc4wAXCcvWM7FSUtvKn3uJzT5Ab6LBa7yGa8HDD5sBgRJ1jbmZ
         ku6WO984Gm32c+y5ZkXblsU9qWnp8nO1Oefzza7gck64CKcGwQNH00CgFPJ8GVvrTbHw
         n8Rl5v/teGap3RA9L7NCZ2Iv9h/99PACgzLvTRQe5DwLTXbbyKUkKTOjWDnHlQvswM3X
         Fg4VhZm8ZSFoFzSu9d1Oyk4n6yUlsFl4B7Agj4dYD6Z36qC7utKvtWN8vljYA8V2jkC+
         EW7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=QUHQVS6i;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id m2si663068wmi.3.2019.12.20.07.41.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Dec 2019 07:41:59 -0800 (PST)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 47fXzq4gySzy6m
	for <jailhouse-dev@googlegroups.com>; Fri, 20 Dec 2019 16:41:59 +0100 (CET)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 20 Dec 2019 16:41:59 +0100
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 2/2] tools: gcov: Adjust Gcov counter count for GCC versions >= 7.0
Date: Fri, 20 Dec 2019 16:41:26 +0100
Message-ID: <20191220154126.1136-2-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191220154126.1136-1-andrej.utz@st.oth-regensburg.de>
References: <20191220154126.1136-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=QUHQVS6i;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

As in linux/kernel/gcov/gcov.h.

Otherwise the extract tool will access Gcov data using garbage as an
index and segfault.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 tools/jailhouse-gcov-extract.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/jailhouse-gcov-extract.c b/tools/jailhouse-gcov-extract.c
index c126f976..5bb337a5 100644
--- a/tools/jailhouse-gcov-extract.c
+++ b/tools/jailhouse-gcov-extract.c
@@ -43,7 +43,9 @@ typedef long gcov_type;
 typedef long long gcov_type;
 #endif
 
-#if (__GNUC__ > 5) || (__GNUC__ == 5 && __GNUC_MINOR__ >= 1)
+#if (__GNUC__ >= 7)
+#define GCOV_COUNTERS			9
+#elif (__GNUC__ > 5) || (__GNUC__ == 5 && __GNUC_MINOR__ >= 1)
 #define GCOV_COUNTERS			10
 #elif __GNUC__ == 4 && __GNUC_MINOR__ >= 9
 #define GCOV_COUNTERS			9
-- 
2.24.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191220154126.1136-2-andrej.utz%40st.oth-regensburg.de.
