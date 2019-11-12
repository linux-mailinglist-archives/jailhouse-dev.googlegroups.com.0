Return-Path: <jailhouse-dev+bncBAABBIUHVDXAKGQEMXDIRJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AE5F85B8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Nov 2019 01:58:11 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id u3sf11366000edp.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 16:58:11 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1573520290; cv=pass;
        d=google.com; s=arc-20160816;
        b=041gyf8Cl0xXXRCfpX6lg+6kGkWjYk7Pn4glHK5iGmulQp75i7paxoShjLlHjcLveR
         YAUf7KexhquAL1dBPELukkqx4qQmuCqTy758hJeJGpi2H1TFs1/xwvB/R7WR6zm4/Tpq
         9UkBeWQ0XwjcFhlsGFB/Q4UC13oBidrniY47fFrLAhkz3AL1YpMUJwqF7v2+2FAGDo9R
         MW+wAxX2OkFdZWYhunC8WsXn/J0HrH8O5eYDqmlvKdg1eogEMfDAlKwLSrX6qHdEONNK
         ZIEQ+TdriZg12B0I2nbJjZkwBGUuyZiiKwzKuvKOPHXnaKD/Yo7CPi2NJEdN7Yps5Ljo
         UBig==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:date:cc:to:from:resent-from
         :mime-version:message-id:subject:reply-to:in-reply-to:sender
         :dkim-signature;
        bh=dPof+6hS0frcBjAJU/LambqnzSspzUHhrHmmSDSV93E=;
        b=EY4OWNEwIJv7hQ4Ex0J7kdjBe1sDNGbzd5KcfF4nvGltlO7fn949nADmUVGLQpiENe
         yswYpAZcw/JvUgp/GEpvjDJW1vZzZXx0aWTDEoC2ZdaajR6QBJIPw0Kkiooohr3OxP1f
         rimU8cAVNTU6CNSy0UNBha206M9qnUKtKSwRIFH4ngDgdHHwHJAHIh8FFA6kqe8lA/Ut
         tUjl+7MLfhfS3gRnsAUUrlgB/+nhGIePkzJ1jKyZf9zwfqhTxGS71uvta3WH3ODRn2gx
         +rr74A0aUZnHDEgELP0NYa1ayOvCPo6sez0SAjFDNRPBr4CoQWk3GVYgFVune7itSB3M
         KI2Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:in-reply-to:reply-to:subject:message-id:mime-version
         :resent-from:from:to:cc:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dPof+6hS0frcBjAJU/LambqnzSspzUHhrHmmSDSV93E=;
        b=TxtQTdMrY0ZQvMHmbcI59uFf+7Wc1Xlk1j7A84Yy79xPnGJ0esOI53ervi3wYXrljq
         ib1IDb4CBcHaCLpJP44nvwxcyH5C3H45SKmJv1lWFEVIqdvG5bqY915LEZmPzUQ7u+a/
         CjAegy7e+b/hIuGmxzH4sMWPbdU9KzeaGRM405d4Pzz6Vvt/czn23g0AZtjJceXpDCoo
         nXscKIaRvEvl93waFpT+jzrnUmszUPBssEbmVeQhy55DpDmEkwmT2wPO+DQAgq5XtEzF
         8P+hsNHv+2N0FLbcBbFCD6klFnIGRaUgXzTAIP/rDyAsxC42fZeqBdLyj7JqyHaFevcQ
         R7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:in-reply-to:reply-to:subject:message-id
         :mime-version:resent-from:from:to:cc:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dPof+6hS0frcBjAJU/LambqnzSspzUHhrHmmSDSV93E=;
        b=J4vD9uYp7z8fR6wRe+DEEJB0PTEBFhAexjbWtftv20MhluTe9xtbpcHCI+UMpAUMsA
         3uzuuBwWFHRv7IOcUsRS++11tP05npfTLhkVHS4XRoAEO+GSbc2g66Du8q6X68R9acjf
         UkfGlLIKMiUaaPkJsOqhbBi7QjfLzZpVCDdbGr2kDkbQUKTgZA+GttjRLN7tHNHiQvDA
         zth/cz0ja4lzF2fVKYSWJMFGyFgKSlyAK0In/Wfc/8l5RrXgzHe08Rg9+XceVYc4IzIb
         ZvAVG/HP+nAe44igd2uZMQMhGLpwDPDh5bCy1tHzXekWk+mqGWC9DT4sb6YYwzEN0EMd
         2iDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW/1gXgvyRT0VM7qc4R90Q7HP/EFoczInIo9CmVQFnWAW7BVCT7
	tReT2tgbv3s1gb06hzd/wLg=
X-Google-Smtp-Source: APXvYqxTgghgF/kQaww/csYIhALpOv27htl6geZD8dYG4imBnebs8OMNlH+KSw74ULjcfwlXDruG4g==
X-Received: by 2002:a17:906:14d4:: with SMTP id y20mr25759864ejc.21.1573520290814;
        Mon, 11 Nov 2019 16:58:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ef07:: with SMTP id m7ls2638656eds.12.gmail; Mon, 11 Nov
 2019 16:58:10 -0800 (PST)
X-Received: by 2002:a50:9fc1:: with SMTP id c59mr30486883edf.305.1573520290206;
        Mon, 11 Nov 2019 16:58:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573520290; cv=pass;
        d=google.com; s=arc-20160816;
        b=0zzuRSjTb0aLjgG0nycbvXml70RZExsaE7sMar2A7QJqpvWaTq1IuhOH+2TgQPiaw8
         mGqGk5K20xt7xLcbmPnOLGhpgAI2Si2edrqkFQPltQqW1YjBJBM7Qck1MNYcoFzQv3Rz
         FXNb4+YXyQ3ZNMNWKpz9xR1+2RfXYUvH3lGoctCFOJZ1FhgCmGx2cGL3YkTgaLpcNGuF
         GvndQq3GLF50N+L+/+mngRl5HjfnMoUz1gwvvu5Md0zaaBdw4Mk+CTCZFJ72pNwVInwO
         lXo1+opt+3EeeVaG4aeYLonRdXcLGgfrVJAKjJU0LIr/Gow058seMekEZLI0hEiUlmHu
         Xx6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:cc:to:from:resent-from:content-transfer-encoding:mime-version
         :message-id:subject:reply-to:in-reply-to;
        bh=Jk/zOz7F2HCs9k9x4jKhQUeRZGkpYKtcruteCPr0cFs=;
        b=pRTtVzxxgzwgr9CWQEN4f57Uog5XFSX8CpBEN1/ozgre6mUyRXt3blxmKN/wkUgqxl
         IP8YBu9AElS35T5yzXe8AhIkTi5DSqfeCZyPmbESuSzfpgoTGUuSIbtEOFlZAm6/kf4A
         BdYlaK4tYZIQTy8RhNVbFe8fJrquV+rvxZLTELVocH18nVN6d1U5LJSX6qRXIcP2wwrr
         hfbO24uIs/kmvukckvb3L/piHARW9mfgfwGIXPvm5yd7+Kzxjxfgqi5/liS6bwgRWVCu
         RrMsTrNR3Ll/1no+7+6vRvSghVvvdsdngA174ISnL4CpliS4Z6UWrrjgHTcV6mFrsHFT
         tphg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass fromdomain=patchew.org>);
       spf=pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com. [136.143.188.54])
        by gmr-mx.google.com with ESMTPS id v57si1638814edc.3.2019.11.11.16.58.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 16:58:10 -0800 (PST)
Received-SPF: pass (google.com: domain of no-reply@patchew.org designates 136.143.188.54 as permitted sender) client-ip=136.143.188.54;
ARC-Seal: i=1; a=rsa-sha256; t=1573520185; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jxbnp4JZh2ydYN/MU8/qEYO+BuwQFtKG8Kr3fngwkbQA7KPueOrZxCHzdIXHgCrVgllsswh8exVo4JPLQv6W0KHsHfR1fFhMt1CQgwXdrZYxxPp2cinTfEN/9Zd+ibTxMAcGs/t3/r7pUM9FGb6WkKvFE/4ya/2MLYHx5bFbatM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1573520185; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To; 
	bh=Jk/zOz7F2HCs9k9x4jKhQUeRZGkpYKtcruteCPr0cFs=; 
	b=EYC+5LKLg7RuItH/01GCNEKEbifqFvtyvWDFFxDhtXsf1y5V4xmzg+RnpwiA+YxoHJOPuL62PEyb+gpIikNg6Y2wN9+9Jw2CSZYfIrhXLXAmG60YgUB8vt859TSkiJ6neUoLAc0UqrBaE233+osykIu6aQUg/vpF1o+BofJ/jFo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org> header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by mx.zohomail.com
	with SMTPS id 1573520182725997.9204563601448; Mon, 11 Nov 2019 16:56:22 -0800 (PST)
In-Reply-To: <cover.1573477032.git.jan.kiszka@siemens.com>
Reply-To: <qemu-devel@nongnu.org>
Subject: Re: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
Message-ID: <157352018133.9707.15852640482814208357@37313f22b938>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Resent-From: 
From: no-reply@patchew.org
To: jan.kiszka@siemens.com
Cc: qemu-devel@nongnu.org, lyan@suse.com, jailhouse-dev@googlegroups.com, claudio.fontana@gmail.com, mst@redhat.com, armbru@redhat.com, hare@suse.de, stefanha@redhat.com
Date: Mon, 11 Nov 2019 16:56:22 -0800 (PST)
X-ZohoMailClient: External
X-Original-Sender: no-reply@patchew.org
X-Original-Authentication-Results: gmr-mx.google.com;       arc=pass (i=1
 spf=pass spfdomain=patchew.org dkim=pass dkdomain=patchew.org dmarc=pass
 fromdomain=patchew.org>);       spf=pass (google.com: domain of
 no-reply@patchew.org designates 136.143.188.54 as permitted sender) smtp.mailfrom=no-reply@patchew.org
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

Patchew URL: https://patchew.org/QEMU/cover.1573477032.git.jan.kiszka@siemens.com/



Hi,

This series seems to have some coding style problems. See output below for
more information:

Subject: [RFC][PATCH 0/3] IVSHMEM version 2 device for QEMU
Type: series
Message-id: cover.1573477032.git.jan.kiszka@siemens.com

=== TEST SCRIPT BEGIN ===
#!/bin/bash
git rev-parse base > /dev/null || exit 0
git config --local diff.renamelimit 0
git config --local diff.renames True
git config --local diff.algorithm histogram
./scripts/checkpatch.pl --mailback base..
=== TEST SCRIPT END ===

Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
Switched to a new branch 'test'
45625de contrib: Add server for ivshmem revision 2
df18ce0 docs/specs: Add specification of ivshmem device revision 2
ff35318 hw/misc: Add implementation of ivshmem revision 2 device

=== OUTPUT BEGIN ===
1/3 Checking commit ff35318fdf84 (hw/misc: Add implementation of ivshmem revision 2 device)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#63: 
new file mode 100644

ERROR: return is not a function, parentheses are not required
#206: FILE: hw/misc/ivshmem2.c:139:
+    return (ivs->features & (1 << feature));

ERROR: memory barrier without comment
#250: FILE: hw/misc/ivshmem2.c:183:
+    smp_mb();

ERROR: braces {} are necessary for all arms of this statement
#625: FILE: hw/misc/ivshmem2.c:558:
+    if (msg->vector == 0)
[...]

WARNING: Block comments use a leading /* on a separate line
#775: FILE: hw/misc/ivshmem2.c:708:
+/* Select the MSI-X vectors used by device.

WARNING: Block comments use a trailing */ on a separate line
#777: FILE: hw/misc/ivshmem2.c:710:
+ * we just enable all vectors on init and after reset. */

total: 3 errors, 3 warnings, 1147 lines checked

Patch 1/3 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

2/3 Checking commit df18ce079161 (docs/specs: Add specification of ivshmem device revision 2)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#24: 
new file mode 100644

total: 0 errors, 1 warnings, 333 lines checked

Patch 2/3 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.
3/3 Checking commit 45625def0d51 (contrib: Add server for ivshmem revision 2)
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#77: 
new file mode 100644

WARNING: Block comments use a leading /* on a separate line
#174: FILE: contrib/ivshmem2-server/ivshmem2-server.c:86:
+/* free a peer when the server advertises a disconnection or when the

WARNING: Block comments use a trailing */ on a separate line
#175: FILE: contrib/ivshmem2-server/ivshmem2-server.c:87:
+ * server is freed */

ERROR: memory barrier without comment
#194: FILE: contrib/ivshmem2-server/ivshmem2-server.c:106:
+    smp_mb();

WARNING: Block comments use a leading /* on a separate line
#276: FILE: contrib/ivshmem2-server/ivshmem2-server.c:188:
+    /* XXX: this could use id allocation such as Linux IDA, or simply

WARNING: Block comments use a trailing */ on a separate line
#277: FILE: contrib/ivshmem2-server/ivshmem2-server.c:189:
+     * a free-list */

WARNING: Block comments use a leading /* on a separate line
#342: FILE: contrib/ivshmem2-server/ivshmem2-server.c:254:
+/* Try to ftruncate a file to next power of 2 of shmsize.

WARNING: Block comments use a trailing */ on a separate line
#346: FILE: contrib/ivshmem2-server/ivshmem2-server.c:258:
+ * shm_size value. */

WARNING: Block comments use a leading /* on a separate line
#619: FILE: contrib/ivshmem2-server/ivshmem2-server.h:63:
+    const char *shm_path;           /**< Path to the shared memory; path

WARNING: Block comments use * on subsequent lines
#620: FILE: contrib/ivshmem2-server/ivshmem2-server.h:64:
+    const char *shm_path;           /**< Path to the shared memory; path
+                                         corresponds to a POSIX shm name or a

WARNING: Block comments use a trailing */ on a separate line
#621: FILE: contrib/ivshmem2-server/ivshmem2-server.h:65:
+                                         hugetlbfs mount point. */

WARNING: Block comments use a leading /* on a separate line
#622: FILE: contrib/ivshmem2-server/ivshmem2-server.h:66:
+    bool use_shm_open;              /**< true to use shm_open, false for

WARNING: Block comments use * on subsequent lines
#623: FILE: contrib/ivshmem2-server/ivshmem2-server.h:67:
+    bool use_shm_open;              /**< true to use shm_open, false for
+                                         file-backed shared memory */

WARNING: Block comments use a trailing */ on a separate line
#623: FILE: contrib/ivshmem2-server/ivshmem2-server.h:67:
+                                         file-backed shared memory */

ERROR: spaces required around that '*' (ctx:VxV)
#742: FILE: contrib/ivshmem2-server/main.c:22:
+#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4*1024*1024)
                                                 ^

ERROR: spaces required around that '*' (ctx:VxV)
#742: FILE: contrib/ivshmem2-server/main.c:22:
+#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4*1024*1024)
                                                      ^

WARNING: Block comments use a leading /* on a separate line
#906: FILE: contrib/ivshmem2-server/main.c:186:
+/* wait for events on listening server unix socket and connected client

WARNING: Block comments use a trailing */ on a separate line
#907: FILE: contrib/ivshmem2-server/main.c:187:
+ * sockets */

WARNING: Block comments use a leading /* on a separate line
#977: FILE: contrib/ivshmem2-server/main.c:257:
+    /* Ignore SIGPIPE, see this link for more info:

WARNING: Block comments use a trailing */ on a separate line
#978: FILE: contrib/ivshmem2-server/main.c:258:
+     * http://www.mail-archive.com/libevent-users@monkey.org/msg01606.html */

total: 3 errors, 17 warnings, 963 lines checked

Patch 3/3 has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

=== OUTPUT END ===

Test command exited with code: 1


The full log is available at
http://patchew.org/logs/cover.1573477032.git.jan.kiszka@siemens.com/testing.checkpatch/?type=message.
---
Email generated automatically by Patchew [https://patchew.org/].
Please send your feedback to patchew-devel@redhat.com

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/157352018133.9707.15852640482814208357%4037313f22b938.
