Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBJOG5XUAKGQEEC2RXRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 393255D117
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 15:59:02 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id n49sf19527261edd.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 06:59:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562075942; cv=pass;
        d=google.com; s=arc-20160816;
        b=S4OekjIoQGoZT9Q1yLOIMvUNhBAB7g5aSaUUl5sOEGWL6v+lr2Bya9CoPY7E/cx5rP
         zznwx9JM+ce8c4XGIK/kYXIl6xQ9zR5pJCMLvaGELVM1/YtvxkH/i/XaM+urKt9MwF+q
         6J4ywZFU1/kyevVDyY39PnrvwikAWgs+Z/eRzFoLDXN7AM0+pFad6nNNVSURYRDM72Ej
         yakAXNhoEkdnopDpIYD/5nSQnvHmvCk55PZlDNgk66iAxXEeEwPvcn3mKQ+0GD9KobtV
         gH2AE1J6oHElkUStf77ahT+LnZH3X6sxzi/VmLK6AqbBW4AEfQQtLkNFqiaqRoCMgYqN
         lejg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=LiMlVls739ccYyfpiXu0dqAWx7cWlXLjL1eGfaW8gu4=;
        b=Knw0/jb9YzIB5XEXIVjMe78wn44WI2b0xSzL4iMwFLXbWkYrhECXanmPFzu41lAgKH
         l3eR4jKeFERPkBtWTgBOEQT1VuwGYuQrRLZfcf9Fqj2utUkEFOVf4AF8EXPa28lSZx57
         o/ngWZGkfzrfhUls00if8olJed2ux3XlodwTbrO88p6zK3S3HKmPG5hv2cx6JtNVVCw2
         oWoWE/qgkS3I1DwAHIjDwwOPq+EhT8mK5AY4URX0VYCf8wj7Kdr8cM14i16F7dk30CIJ
         89krYddug/6ULw7M87GQ1eyB56P46z4q56N+UZMARIKIrOnO5O4JymnZckCda1/iucfm
         yPQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=E6kjveCO;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LiMlVls739ccYyfpiXu0dqAWx7cWlXLjL1eGfaW8gu4=;
        b=m6TLhTlshnN/t3kHH07ZsyJkFQSH+t+tTncKE3McXbjBW4hNmAZxEjWHakL61iUGb+
         eiXz0EIP1/U2K4bRuHbOMXEhP0RD6q38u89/7naRN2rKrffvun4UAnsNTyRaOpc1LFnH
         3McfxlcNcCuku7Bcdi6renWjeorZ+SQuaxNjwHc7NMTrL1BmMaZEGS613ZT1Se9LQodK
         wk7BUWpfVesmkPN+tq36ZYcTm8p3w+oFisiQ3uZEkX4ctC5hJNvqJeZBZpKEz+YObkKm
         imhBbNI3fyTfrCkEFwj5WL5dv0nyZWTwKwH0dOzoHic5nIK0pXKzzqyVApbEk+iYX/3n
         extg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LiMlVls739ccYyfpiXu0dqAWx7cWlXLjL1eGfaW8gu4=;
        b=pp4l4zNe+NvqBo6R4SGssgESsO71m6+VAMOo5SjQ5XHfCQl+DAX/YwGqnK/cvy+8ur
         P8A+OvV8ctSI6hPeEiPHiFqIQfos4FjnX7BayoaDtpmQk1l/RlaInOqP17RwET4rbJ2C
         hG6kYbRHA11FsjyUKHCEpO00d4RozWn7oJ4YehxB9yNWjbJZDNVGuaK/uebXvF0zFpZM
         tCVed6Vv8J05HrKMHSo5QeTM/MmcHgvIO4eapvLNjJdJ/U4EVh9FITZgmSJUZQ/3JBtP
         UH7TjZTJJA/16jfpMjKOjTcjYZw+GGs7uE/Db8HazVeNiXfa9MIadq44yyixEj4okY09
         r+4A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXsSNtO+9B2TOaBbgJ4XiZnCPVZNiVuEgZTxfMGNm7fvkB5dAII
	t5QcR2PzxYHaTjXft35vnWI=
X-Google-Smtp-Source: APXvYqxldsuXvQCSRg96Z5S4DnYYyVJ7wtpM6rLae3mPLJ9hocXmaE0Fe89zHBjUF3xA56qySizAZg==
X-Received: by 2002:a50:adec:: with SMTP id b41mr36713716edd.102.1562075941972;
        Tue, 02 Jul 2019 06:59:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2f11:: with SMTP id v17ls3399649eji.6.gmail; Tue, 02
 Jul 2019 06:59:01 -0700 (PDT)
X-Received: by 2002:a17:906:69c4:: with SMTP id g4mr29278663ejs.9.1562075941430;
        Tue, 02 Jul 2019 06:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562075941; cv=none;
        d=google.com; s=arc-20160816;
        b=e114mFy3PO6HRgPOKYx/dlNPFk1Bt00mfymMN2O/HZduSTrCxZMSYfaskFTI/aJVui
         UbByrJ9s1RAmZ/bAZ7WI3w9Km0gp1VZLv9Im01AV816LSfwCMA+quGWCw3hxn/lr39WD
         0zLdkr23+kXfJN920nXd07w9ZoYMRk+u+GCxATr9y+YeMqDV/yoMK5dtDEzi9twHj3x6
         inmb9bMIzVW0iBN1V1vchdBDgy6YO5eCk84A6LnSev4Ym38BNC6/vzrXbP/TY6gl9cms
         F2/j/eAb7Si8TWfbRNPobpJgUIpagkrpEJr5Ga+o+1u23ennzheMQxWXZ6NCdNqbZh/B
         md+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=vPiin1eDB/0qkymbCLkQZlXruZPaUFSvOEM0OFFYM8w=;
        b=Ew5r6nm2U/P4OPxZtD6pQfXdA8stPwxMGGnUqmAHiyl758Hu/2CmprikpSBz8AbZ0A
         53wfUyuSn+FTJn43/rZfA/Au7VPc85kZnTXIzXG2UpoD4qNzGDJ+Qvuj2gdlQyaQbR0J
         Y9Ff7Ha2qy9ghFYkG5MMq4AIBizzW0UbFsXHtyW1+E8b1jSwNAkYXt+i+Y20DSsOlRh0
         cy/ZTCCXvAqqp7d55cU+eZT73g0nZ1VqD5sr0Uw/zmpYy1L9KwfMGewtc2c8y0ThzP+m
         te8g+sJA13OzZ6zvwlMZwYy5Vm6D9wpEgLhDNIK1dyaeCt3xILL1pQF0OBkfbdSNh37W
         Sjvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=E6kjveCO;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id 91si374311edq.3.2019.07.02.06.59.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 06:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45dQnw6XfczyH4;
	Tue,  2 Jul 2019 15:59:00 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 2 Jul 2019 15:59:00 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@web.de>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH] pyjailhouse: sysfs_parser: Ignore empty PCI bus regions
Date: Tue, 2 Jul 2019 15:58:46 +0200
Message-ID: <20190702135846.20045-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=E6kjveCO;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

On some systems the config generator permissively maps huge chunks of
PCI Bus MMIO space. This area needs to be intercepted by the hypervisor,
as parts of ivshmem-net devices may be behind that area.

Hence, ignore such regions.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index f48f249f..4a06ccdc 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -105,6 +105,10 @@ def parse_iomem(pcidevices):
 
     ret = []
     for r in regions:
+        # filter empty PCI buses
+        if r.typestr.startswith('PCI Bus'):
+            continue
+
         append_r = True
         # filter the list for MSI-X pages
         for d in pcidevices:
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190702135846.20045-1-andrej.utz%40st.oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
