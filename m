Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB6UBSDTQKGQEJ6BJ6LI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E6B250F2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 15:45:31 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id i3sf30773033edr.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 06:45:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558446331; cv=pass;
        d=google.com; s=arc-20160816;
        b=rvsNnNLnOl6Rfanmw5eii6NwhP8l9ESIl18J6aAvhCP97kxuduVNLtIAuIgKrUcVJF
         w961Coo9d2HHN2kt0LpN8ATEw9Mrt63q/2JaJTt7N39TdoK4q0MWFHtxWY6vZ/yR9Ui+
         QzdBfmRBE7Tod/BOGciQIFZ9iV+dL0ynGchMu3NaR8/PxPtHzU8KOXaXmtw7yN9uLuJW
         B02YpFT5wvY/QxF35WwILOAm/RPdAVQoubh1oMy4FmIbn6Od0hcxYVqUzdxGtSbOASTk
         nnGRFhKQtViQsl/3ZuVmRUgavLUG5/6mpRmhgmkpZpFXjrRr75rhqH3jAAytZmypqCeR
         r47w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:openpgp
         :subject:from:cc:to:sender:dkim-signature;
        bh=jUY8WyCENuRLKOuaYKZTOmYSjUmEPXHpPvpUc/FAutU=;
        b=prnRYm35SugUovGnQeRYTTxFdLTOOdkRBzyV3RAN78lr1kgsJrL3AJP6PUzSyHZad3
         WClKXBZNCWSOR1vmYdjn+Ovan5gBB6nOlp6Ubgfk42H4pkMIrOORguO/SZ2rsYbkCDHm
         rfRAO2yqiaxzXiB4x7nZhyRrm8Vt57ZrlKzsBKiaJz6lwQm3GMWnDAsbByAsWX3ArqYX
         AvN7vNqAD/j0Rsp2QyR+ZwnF6PY/fdLQBkQPF3q7U2KntyYPeav0LGTbvAHT0ZVo65Lq
         r9D7BDozc6lJ1grq6EL9LVfTgGVW6jEVJliJZIgTrMVQLPRqCYlcJpfYa4w7b35hwGkC
         PjRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PZVxfwqS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:openpgp:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jUY8WyCENuRLKOuaYKZTOmYSjUmEPXHpPvpUc/FAutU=;
        b=EwDrwfMSNkYbNmnAqRWNIOnp6iDMxGZMu4hZQtfC/QuAuWoBThonEl8V4EDwzE9uNQ
         3kecWOhmvdFPIK+KrU3LLuGjZJrZnwwoMDNNwwponY+aziRzxIXQuTGNNFAxC/qa8aQT
         V7LgQ/PjDg8X3vUEERspazVYE2DEJh+LIFfalgk+AkAUT92+wvnrbVgB693G7PSXnuPz
         qOpEqbOBNvhok7Zmp284QcBN0kGticXVE8tpbzHtX0ezGXkZElnCt75clIPft9kl39iK
         1GqIPZqBrF0rH92XDF2dAvbyp60aeSXpH+3chr3p2w2psLSN+jHc8X141cD+5dTrYOkE
         5UnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:openpgp:message-id
         :date:user-agent:mime-version:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jUY8WyCENuRLKOuaYKZTOmYSjUmEPXHpPvpUc/FAutU=;
        b=QyTiPFmUsXHtyQpTHYhQDTQvrGEjjf8XaiYe0H4Z1gaRLcMXpsFjJ0VmD3ozckhaCl
         FiwZKkE98bBSmDWuAV4dKGjy/zsRgMBTgSU2oOk1yO3w8qw0V/jpVBqpdqVc3ehvAto8
         QpR6SdVUfDrp9LJpJYsP81uZieu64SE8xnEmt9WqfXU/kI/7cyRXlsb+YZEMzrzqVlTi
         9GGdjyhMmAPH5W1XRz1LS4qJy1+PufUm4qTFg020YSdPPBeDepwpOq+axKImU+UBbvjw
         mckePOK7Z1AVpL/Ec3tx70libnuVrL9hxYFng+KNH1tFTyd63vc9gS5ZGOcN6UU5LFTw
         KEsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXEgz67LBlu/yovs9JFPVeJyNXhpyT0ksggGQ98UlZbc63H3sKC
	jMV3t0nEk5IrI4GZmkBoAXs=
X-Google-Smtp-Source: APXvYqx6T8QbIHM60qq61hxu9sFxCP4EVu52kEWT2kACFlm6rr2Zz3u/4oXu4UEBZmYCGY6ogrZf4A==
X-Received: by 2002:a50:84e1:: with SMTP id 88mr82382193edq.193.1558446331016;
        Tue, 21 May 2019 06:45:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6dc1:: with SMTP id j1ls1626010ejt.1.gmail; Tue, 21
 May 2019 06:45:30 -0700 (PDT)
X-Received: by 2002:a17:906:139a:: with SMTP id f26mr45452425ejc.154.1558446330312;
        Tue, 21 May 2019 06:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558446330; cv=none;
        d=google.com; s=arc-20160816;
        b=bagTL5E57AKJEU8O+ymk4+7ic+Pl0+RquZaeUII8bYyjEF+1H6r5GGg4t7ZFz8gFj2
         ympuKfNBlVhQwJyULrsTU9PDtrR6SanTcs3rzX4jq94FNqux+mUvgGWn94w869sPAddn
         gyTBAMDTo09pjpPHzseFo8rXynk4Zm743fHkq8oFwB9p2o988aCxivptsg0ruee806jo
         Jhgi1JujrECW4ajIefH1ZTn6kKeOzPDoJKprTehMFDlP4hfIWDLPD3QSBNuu25uYIF0n
         9Z5cqrKiC4gRE0jOHzIWhKgzJyrgN63s2ebKZK4lhmaD8I8uKsDel0s5cjSjD9ozW4jx
         SfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:openpgp:subject:from:cc:to:dkim-signature;
        bh=Ud8zYs5Tx6qVn+qBUNwc2M0rL4vZ7tTzHoIECKHKqAU=;
        b=OyoYKEZoXd92ABz10G6KX8nq+ScRW0LM+X9bWP2Fk9G+6we7l3KAXlZD5LJ9oCnrVB
         Mi5jbWgbkdKgpt/eZ7xckmdxXGtCdpa2nqRfdAivzt3Jw52gHgTwFvXtLv6xq5XFtivp
         pGny38KzVCzfwYgbcQD/8bdLhOthLIxZdM163wNlJcVjyRdP4pOSiIZmBz9TVptS8B2h
         bkV7Q2exXOY3Vg8/Sk7+yrqtIj/clf32tWBiNEW7WdHYiAwncPyRM3SXi6ZxYt38pzKc
         XIxVEHLxTX8phZXGaifRYy8iUDiD8dCU8Q+5CKEpTz/88Qv70tFBWMecLLgKWceiTz8j
         va8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PZVxfwqS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id z45si2243760edc.3.2019.05.21.06.45.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 06:45:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 457cTj5cF5zy18
	for <jailhouse-dev@googlegroups.com>; Tue, 21 May 2019 15:45:29 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 May
 2019 15:45:29 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Mario Mintel <mario.mintel@st.oth-regensburg.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: VT-d: IOMMU exception with unknown fault reason
Openpgp: preference=signencrypt
Message-ID: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
Date: Tue, 21 May 2019 15:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=PZVxfwqS;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Hi,

we have some issues enabling Jailhouse on a Intel with a pretty new CPU
(Xeon Gold 5118).

First, the CPU supports PKE and Linux will enable it (CR4, Bit 22).
Jailhouse won't start, as this bit is marked in X86_CR4_RESERVED. Didn't
have a deeper look into this on how it affects the hypervisor or
allowing it needs some special treatment, so adding nopku to the
commandline will keep the feature disabled and suffices for the moment.


Anyway, after enabling Jailhouse, our system freezes and we have some
IOMMU faults on a Broadcom ethernet card (04:00.0). Find the error
message below.

We have fault reason 0x22. But according to Intel documentation (latest
version from 2018)=E2=80=A6 There is no 0x22. :-) I already checked if deco=
ding
of the fault register is correct -- nothing suspicious.

Any ideas?

Thanks
  Ralf

Page pool usage after late setup: mem 704/975, remap 65560/131072
Activating hypervisor
VT-d fault event reported by IOMMU 3:
 Source Identifier (bus:dev.func): 04:00.0
 Fault Reason: 0x22 Fault Info: 19000000000 Type 0
VT-d fault event reported by IOMMU 3:
 Source Identifier (bus:dev.func): 04:00.0
 Fault Reason: 0x22 Fault Info: 18000000000 Type 0

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4eb2d565-fa3a-4742-435b-d4fa1469c60f%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
