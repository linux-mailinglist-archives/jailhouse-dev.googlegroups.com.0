Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBV7UT3ZQKGQEWQ6HSUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7EC1802BA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 17:03:50 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id j5sf2024869wrt.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 09:03:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583856230; cv=pass;
        d=google.com; s=arc-20160816;
        b=n6sRB6QbQwToe/C4ZxWdzqYgiBiHroKXwRjrYAcj/qb9b8Zi7BS3uxu1IeCyxvMwN5
         3XdWm0bXfiSBGCuupXdsUiDdZb7jrGJHdydQ77iqWu4bYtL7a3KXcQ8ia9CNMvB43V8i
         jLjNe0ZAy+97sNWYUTT1Ry3Fro5w0Nev4l/+IaAOUiC66jgVgg8W2BCizcFXYdUHR85d
         DRdQFM6bY5zCT1Zc+JUsSl9+kzSO2dYCXkI5DeOiQeiTOZPPrxE6QVPprOeNpsr6zmW+
         2wZ1n1RTcUCRBP6lKhvvukIszQNXsRw99trX9WQRhzdlW2ugV+84yUcHNBspW0YKSDPN
         e+Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=H9f2mBYu9aSzcHPfRog7AGB6HuAZYjLiInKI2XiMXWQ=;
        b=oadyRIwwcP3vIkiz9Fe6W+CmgDaRQIaMvC8Qj0S5bxrEwZcRhTVAgHC4l/jD2zQ0Vx
         rtbqWEamKGbPbSw8MXT0AwXOgC91+S8cljOHRdLMar7XZ6nnk6pQZjO/vuCZb1vqLCSF
         UuCJwlWeD+pzI8fhSUojnUJjcp4S8A6S2CuZy19Wo+cv6Pk7WX7sLVrXtXBrYwrDWCC0
         gkfMJyc+UPVkyaYAwoeOpML1wPizPDx/dMYeR2JihysZqhw/Kot3hV+s+sd/XxpOCHhy
         zsKGwUnQgrXlVU3prowirhNL/Fn3jLTObuwyI/5DTdzRkiALiMlVDr/qzIFkf4Mgo+HU
         p6/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H9f2mBYu9aSzcHPfRog7AGB6HuAZYjLiInKI2XiMXWQ=;
        b=hHSsL5C/jVYyc6EBWhYOXrKlWw2GVc+IIcvE378qAg4OW3KMfLjKUnmWcpXrjXhRcJ
         XbhGFa7Y7e1DlZfQJCjyi6oeIO4TfB1a092gzMPbTtL0thdumCzbM0VYaqPHxbpYnZ3m
         UW7VTLqJq8e9IDkrvRrkT7EUFYudfp9LkSphfzW9ghUZn2UA3dSRybnemBYt4R+xj2uQ
         2dyv+qkSmhYOuh/qGOOghN8ljaeH4dwRimqdtmhx/8MKCm8OFFgrMjt84UwTm9MvVtWz
         3fsCFFuO/wGjWVjUqiAfkt/IbzNthZfzyz0k1VRl9ljscBBEBcmoAklF7x4dSdX2yIpW
         TZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H9f2mBYu9aSzcHPfRog7AGB6HuAZYjLiInKI2XiMXWQ=;
        b=PK+FWpVd46M81wvrE+28ERGIoe9Y0DX4YgTIzizNjXmtIiIlhhmpGcSQADLYWsCTgW
         +RRGHRX0bhcE1pS8GcVpBRdPa8pFIoIgTdFsEE2j4iQA+vcpg2nFPFT/zr3SW2xeMcGS
         UbZcbM8TP8jCNOXkUDSV3PQDqsFVpBPHchVItplah2thCCOA7asZR3ojEFkTZn0Vl3za
         zpPaTkJresRabb8PiqPJQ4GJrap3rt5ok5jhBRgwCgd4DUFvFAKv2CglUc7JCFpVmD5f
         rzNWPvT5tcgHHKhgwh28toKIBBMWUsLPKhr/ZeB9ehhKKRaDrQUf5UMaRV7RAx46J95K
         4QFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2T7zq08HjjnpoBJuWe3Fwy9cncd1VHJDsbDweB8A8s4JSYUGC5
	BWHqvkCjcw01Zfjnog2OMVk=
X-Google-Smtp-Source: ADFU+vttKLRWlD3SuNn09BKrPgTZNABiyPhzTSigTRbAf/6YYpnF4Al2PfyLTZ9wQ7XpdQjaD/HlpQ==
X-Received: by 2002:a1c:a345:: with SMTP id m66mr2977086wme.114.1583856215865;
        Tue, 10 Mar 2020 09:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4c6:: with SMTP id g6ls625901wmk.0.canary-gmail; Tue,
 10 Mar 2020 09:03:35 -0700 (PDT)
X-Received: by 2002:a05:600c:214f:: with SMTP id v15mr2905161wml.110.1583856215120;
        Tue, 10 Mar 2020 09:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583856215; cv=none;
        d=google.com; s=arc-20160816;
        b=aOt4o5YQcl0jBthOKbPH+dHPY7eknh9BT4lTq8LZK2G4iIc7HFhe1gZrBiQqutrgMv
         6LJslp9NdxlhO3PkZbgyYXjyinFNKu2qGC5x4Dw3c2Xe9qfWaucI2p7PYYOltLgnz/K3
         OWKG481FpNA5YMX/uerbX3XB/cTDpwcY4z6OsGCeZKOa/a1cdcBzPSRlFTrjBB+NRba9
         rRtAWSCJXpMBZs+br6zA4YSZaEmiwXCN6oKjN+hkhyvQ/hnt16FTlNvnemfY796+ZAs2
         SVu1QwtCMekdFVYjKU49bkROkZx/xamx2ZGHOJQ6EF8hyOu10lWLs34wduG4DQjapUNj
         rPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=4TsbGmf53DtO5q5/oAJUmbopH4gu41N7T1wmnAolxMc=;
        b=JPEmWuhpUT/3hC9wXb1AKJYlwaVGMzuNd8/OPbZdPV+eEM8Ut6Mniej1a5cbbUT1BR
         usnSz9GLZ2/DEW4v/FIKAh/TBx77CvPlOaDNAhoSqxphpAq4XS8A7l27Spk1a6f8Ghb3
         ZrFHKZaph7tRNn+wCSFRglmg6AAC8ihKxPy1wNCYA7SaqTyxGJUy20791aSqT+ufoHW2
         jlCNeAIW4t7GSmPV+gJ6jPl7u1jUoL23KjscdGyj6SPVRp1czh1zqLbkPbY6TjR/OD8l
         YM8lkNNM7tCcKvCf2B2EIh3jV6hd9CDZ2nWTnTTaK82FGWxYgYtVLwtN/k9ovbkZeh8A
         MBXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y185si136623wmd.2.2020.03.10.09.03.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 02AG3YKY023932
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 17:03:34 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02AG3Ytj021750
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 17:03:34 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] core: ivshmem: Clean up variable initialization
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <25d3ac59-eb24-2169-6075-a6756fbcea24@siemens.com>
Date: Tue, 10 Mar 2020 17:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

We can use the local id variable also here.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 084c233c..a5cdcf93 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -441,7 +441,7 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 	}
 
 	link->peers++;
-	ive = &link->eps[dev_info->shmem_dev_id];
+	ive = &link->eps[id];
 
 	ive->device = device;
 	ive->link = link;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/25d3ac59-eb24-2169-6075-a6756fbcea24%40siemens.com.
