Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB45HZHWAKGQE5KG6WKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CDCC262B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:13:55 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id h3sf6971814edd.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569870835; cv=pass;
        d=google.com; s=arc-20160816;
        b=RcyAIcl0K/4Ui0gGD2MwFHWI5GGMSeq4BY+m59IiJH9536M0mOkzM20dSZuuY+kPbs
         eiiufTqPptSDjK14Hq3WS+9Z7jJQcZ/26f6QevenwFpXlYsoIMkC1ZVSWWcD2Bky16KW
         qeJH+sZl0nKRCI11CWn2/CmxGuFEnN46hvBz8w8WFCCXoO+CD8Qvc3I1Qdvy1gEvAmlW
         g/BqdhaKBynpzvaZGs0hmLSrERoSpCBwDp1Cz9h9dlHEznu6KOsEqgEUlvb2fRMPxUcN
         570+ocbrCbYTur7hOehXI5XysXYfLsGs9DC72fkRvM8tCLS1DIaHJMHwQBvYnFzTHPpf
         okbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=1GjroZ1u0mRUWIKrPFqtH5jmV5tVCt50U2ydr7NGVuw=;
        b=mMy14lcOjUckfPLPzA8dDS28G7zyJc1210DYj7it+4FK9HLbQczmSNjgAusOI2k0Wi
         f7Gykac/vt25u4jLEndOt+1ZaUDgK7UXg3UKu3b7mnd3XO0rYiPb0mIy9TcuNENP58+W
         XFk9P195Yaia6VWwdLRdYOLSmhPyBLGF15yrmCnEZZTG54rGRGmQFsiyRPux6oDjvLg7
         SC+unIZTfQgE31nya6xqMNBFtUaqQ79TGE9Uqp0GMRWRhPADZEWVX0FeqAwsnJ5/ghKU
         +1pQnr+UQA5EP3Ze1v+I2hNfNrC4uhtrjvJOTd52mw7KEOplBa0a5+CWfE2bw+AHtlxC
         03pA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZbcmZIu3;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1GjroZ1u0mRUWIKrPFqtH5jmV5tVCt50U2ydr7NGVuw=;
        b=C6EoreeeRo/JMXfFboshfYZ7grMp1gSD1w2glrNYUBI+GJYGchY3iDxMkVEyTxeAr1
         9rc2yUikRQalVRIdQ/yUj22K29WQWRjmJVG1/Hz4T8yPZs2mSyi3PHF300fTi3dYVwdY
         29GyJpuC/oY7tA4TNdp8W9UQbauH3oA3kjbHwnVMXxn/5AjIVQcZVSLkWtuC3Gz7H0Xx
         lxnuaXfjnsMG3T6ewWiX8/EyRL2we8aeI3Pl5ATFaYVQB51K+Xa6IH/rDjZCelTdMtCN
         3skKkWTv9qoLK8XaDiMdbalRzDIGnjd33Mp/VWTUan8QS741rF/BDgfjRE4KkCo6bXq4
         UUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1GjroZ1u0mRUWIKrPFqtH5jmV5tVCt50U2ydr7NGVuw=;
        b=k83spyZ13eqN2eiOGwMKX41cnF9gMF+5SFND+QfgGxBhsI0u0ABrcTWkxfagcxziFg
         SIjGSWPKsGwGnJ8qFRUjbeJUXtDbbW3uVT6VNZLZgOu51gJ2c/sLADdAwFZgQRjAVL4a
         qil8CL1hTzDz9fAbFoVKSlwdwtEwvou6dCen6KlQ+SvwSAscizKCzZjluUvdEK6Q6Ty6
         QT3aBn+1+/3mabFCnig5nS51UJf1yv/a3OGIHc1Lz188pKTV/VCrlmguUNzXoAMa/bVM
         rsd8JWC7cCvDHXxyitD/Ed8Y2mAF8eDlRSyvNFnguhGgVvm3Nle19LS5LX/azBinUWUQ
         X1Fg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXjzPUCD0xMipksOmWnwH2OlPO+KKOOQAXH8630FZ3WAiHIBNw7
	hR/zDCYU6xcbMwJLUK1/dVo=
X-Google-Smtp-Source: APXvYqyHoIXCILJHAKB/JeTDdUScSe57F3TXUbPrVVW0VbYSPygRP0e3SPijz8rfpNIthFP4N8zqgw==
X-Received: by 2002:a50:a5f8:: with SMTP id b53mr21476524edc.39.1569870835252;
        Mon, 30 Sep 2019 12:13:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ace6:: with SMTP id x93ls2433909edc.6.gmail; Mon, 30 Sep
 2019 12:13:54 -0700 (PDT)
X-Received: by 2002:a50:9e65:: with SMTP id z92mr21614101ede.49.1569870834762;
        Mon, 30 Sep 2019 12:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569870834; cv=none;
        d=google.com; s=arc-20160816;
        b=TwhL2wQ0iKlItvBryOlkFTMpDpyDt4uj0uwyjlQgrMdHvgO3lHRpdQkO42RGPdh8V1
         dSWEx0ZUzSMjjj9zLoJafUwAzmBWqWtZk0brczCD4vSIcq/aCjXgGAfdVq1HLQFa+3re
         vTTn6TxTnF8IPzBG1SE5Vk1P3E01R2Dq7i18qRIb8lqbzNK2IuRm+mDitoNLmcwA1uIQ
         knKdYuPmzZyGvA4tzJNTtnkuzEnVzmqkiU6rfOe8YW/uvHhfTAJrNX/+rYlzmLnpNQG6
         KRR6eYmR6Fg0/wQlbT0r9iwBqNuJfRLjGERf73HEfU8w5cf00plzKuXWac0wcAGkHmp0
         9zBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FlfKJ8+NqPKwox0oXVMOo4CWhbiJdLWAVTaH/9v8zkM=;
        b=Plx3bbeouBgdXf82/LMYUvjrJ460Qm9OV6kTmFPxLv5DR3bHpl2Tk8VuxGVsvWUEZm
         wCk1ZM4CuIyJwhlkNdBNZZswzy6JC9/4GvoRZKqMtNxZxUeEKoKjUry5fY6FK2A+lpxM
         MSoAohixj8JXXxsiRKAMdD07mk2hwHSYvVfCFp1AX0XewfF7Xe705BdmLz3gLR5l80uZ
         RV5i4zOvKe5hH41RKTeukg0IRPu6yOKLcfC9L74TjGvqTX4o2shF6gx5YXvgOAWEaue9
         EIB5tdyDS+u5tJ6VUtMXPAPu3nFHpU9DQsI7m0kGRKFhvCxxvmYKp4eVnQKS/kbA38Ov
         zGeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZbcmZIu3;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id a15si714378ejj.0.2019.09.30.12.13.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46hsWk2pxczy6m
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:13:54 +0200 (CEST)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:13:54 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <ralf.ramsauer@othr.de>, Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 03/14] pyjailhouse: sysfs_parser: remove dead code
Date: Mon, 30 Sep 2019 21:13:11 +0200
Message-ID: <20190930191323.32266-4-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZbcmZIu3;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

There are no callers of __str__. Remove it. Seems to be a development
artifact of earlier versions.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 67dc85d0..f65eacc8 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -831,17 +831,6 @@ class IOMemRegionTree:
         self.parent = None
         self.children = []
 
-    def __str__(self):
-        s = ''
-        if (self.region):
-            s = (' ' * (self.level - 1)) + str(self.region)
-            if self.parent and self.parent.region:
-                s += ' --> ' + self.parent.region.typestr
-            s += '\n'
-        for c in self.children:
-            s += str(c)
-        return s
-
     def regions_split_by_kernel(self):
         kernel = [x for x in self.children if
                   x.region.typestr.startswith('Kernel ')]
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930191323.32266-4-andrej.utz%40st.oth-regensburg.de.
