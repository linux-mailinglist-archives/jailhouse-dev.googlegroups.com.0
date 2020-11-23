Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPGN5X6QKGQEU5AHLUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18C2C0099
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 08:37:33 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id z9sf3279428ljh.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Nov 2020 23:37:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606117053; cv=pass;
        d=google.com; s=arc-20160816;
        b=SSElQaaI5RMQgQjxT1TN6Fl4gR2c1kqv4c1TlT4yqg6dA1dPJGD+Lj0d1AtoWSG9bG
         QYm1/tx548y5YRQYdgQO3crfFYmzReKstiQucwaewLM3t+Oo1G0sE0oXCGLuUbokt1y6
         +i2RnCwHhfYSEoWKsAA3mm64IoqDbRdGzDEvPM/noMALOUVuDcOMM55jYbdW+n3muAdd
         mPOQfdWUoiIWIAnC340GjPlJS8HTu5V9Pp05vy5CgLLm2sd3Bl8IZwGsjyieb7gMbt8N
         eCpcxvoWHevknAD4Ib07oaLrA9D0Iu29hORIG0h+ANowsTaH1ZNlwK0/VMn9VtTvgGBk
         8eFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=jhJcPzgQcyQNlexTk82hnm67Yk1q8i0ROYE/pUG0yo8=;
        b=BFON0seuNxeQQr6aI8L8cXxihBgDfj1L8h7q0DMl8eviE+blnfGSlNujS6cBey2h2M
         vPceJ5qib+Q/zTzeLpWdL75rk3LkkT19f3mekuy7/FQJ6njurCpH7tYL+63EkQ6QgNxP
         8TuifsgGcSjD0EfI2ohE++wOdZ/DCdQnqjFrSv0cQWqIc4xVsDqLOfqRLhf4HyMOGay3
         bNHzKXgpkTEP36p5ki5IsGMf2ZvS0/bGQJfA7C+ZE9MfeLRNKUUeu8k7xSrXOHS6XcNE
         qHbzYsy79PmFNSMRFEzudqSXFwDEf60dMRz13Q+RoN8MVmcKdxDtkmFCzMEnVfNvNd7u
         GPTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jhJcPzgQcyQNlexTk82hnm67Yk1q8i0ROYE/pUG0yo8=;
        b=UMYQCEfV1iMRnvd8eIvED4mdowi9fCPKKQT/0B08dvZ3SjRbWhnuk/uY2lbGBso1VP
         w4xLC+KG5rJCfXTIm/t+o6UcX382TF71WsgcxTTDAQ1jk9/3jtV9+OPz0n/+uCQsDWgQ
         ge/OQT6pzWo0ZI7EqyGgiZ7/Ft8pFGcGLzsL2ek/4t96bOBL3FC3tCKQq/jJY87xg+/K
         QFsbpw8HqJ2b74H5+Gy2PxXgUhtbTB+ZlINgIOFmuQei4dcL6xZ8uKawCjAPqySQ0Bqe
         TgYRmyh/XVYUZflVyKuxn7fKKr6chVp75xrfPlo0cEEpluQ6SbSIL+/mRdLlaZ20AUkR
         VE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jhJcPzgQcyQNlexTk82hnm67Yk1q8i0ROYE/pUG0yo8=;
        b=do8OL0tD9rMJxeDLIL6VsjOB0KnbqzPbIpLpDep/RtHEurb+o1pHEDXmuefEtrmMPc
         8bBpxefY7U/mAnSyOjBNNbHDNw0aHNNRppeRUWogWAFdOu+rjFVm0Av/DC1nW7vabzEd
         dy7hKDDi7kpyH11cY0cH73XE9NdZ4h6gtsLiAfxRW98kgZsXkvvO+ZRxn5+57uRqOEUo
         juB7vKOzoBJwPzgn+GEDNcdQcuHkezRuXGKtiKlAZDkHVGBzkS8AF8vhyK/oGVhYh2PY
         nLa6uVcPDHIlcLZeciuCFoe5uv3l3IyJwPi79YmicUytb9SGeTmEVm90Pmd/zPzOg350
         5DqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533oBH5R/gMWx3g+Rr3kMMzzKyG4chP4zH36uTje8bTEPHnHOqnf
	2ihN0dqeX0T4MS9UUpu48os=
X-Google-Smtp-Source: ABdhPJxvsDKlc7kR8uDZUf+FL5VvHu9iVkSCk/szVKcSTTlraQEjlIDjpNXFtuTAG5klbivYb2bFFQ==
X-Received: by 2002:a19:48d4:: with SMTP id v203mr13599325lfa.169.1606117053198;
        Sun, 22 Nov 2020 23:37:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:90b:: with SMTP id 11ls1930716ljj.0.gmail; Sun, 22 Nov
 2020 23:37:31 -0800 (PST)
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr3538708ljc.182.1606117051696;
        Sun, 22 Nov 2020 23:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606117051; cv=none;
        d=google.com; s=arc-20160816;
        b=NNpBHhU0Wy05wvRXWo2rhPtDzPFLDG+XRq4cjT+gtPgLP3RMV37zLgk2CEuEEoWcqF
         5CPVsLiofukqFHqCUAVLVFcyAJ+kmTFNAX2LQ4+lEGcuTw4/TZrGL3RqC+++zPLxucxg
         1KNPSa1CNskTwVm3KShmIC2XxwcWKR8ZPKStklxbUqUQghavDLKm9uQBS5k6QsZe9Yb8
         +YPen0X/SihJwXmBv2GIp19ViiBMZfUt9tH2ZT2qprGrrqsuxjAZUNeD4JJoHajIDPWr
         Bx1ZdUZ4x36xNBDP2O8CfqCZXnxQMJpKzXaFM4svcchvi11bdKodlSxoiYz+qEhMdZro
         87yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=O4OxtPnYcPrupYRlUFkQ+mlaouLv5jY19h3zBBDXlhw=;
        b=YVbszqJSRxAz/XvqM2MxmC0HapuoDkDpqC6u/b2SbA0tOpkc4WaMJVAk3TwwyZzPOo
         NsueEmEssexvCvJA5NAPn43W/wZNuwS7jjhJudx2a0WIniaEstUi8vY0rcX/oH5EIIp8
         orkpnTgDnFWhUA3mXmd3E05TiJ+Ze5r0v31HPg3DXln61ETgn4tlrddO8KvdqfzRRtmh
         0ezdEg+fT0dOMiFOV9fMKhRSUeWKEN4J91UbHONn3RksuqWn6SQJZkutEDWwDeiw8xhf
         BePXjYEFMMsJhq74aPPcPQvLzgazmBnz7dUUaEKVVsBBI1pIv1ojr/YlH3vqzJTGeTQ5
         0owg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o13si356956lfo.5.2020.11.22.23.37.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 23:37:31 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AN7bUdU001837
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2020 08:37:30 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AN7bTK5001034;
	Mon, 23 Nov 2020 08:37:29 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [linux-kernel][PATCH 1/2] ivshmem-net: Synchronize
 ivshm_net_state_change against ndo_open/stop
To: Jailhouse <jailhouse-dev@googlegroups.com>,
        Peter pan <peter.panjf@gmail.com>
Message-ID: <04d10f9e-9e04-ad4b-a3e6-399f84b2ecb7@siemens.com>
Date: Mon, 23 Nov 2020 08:37:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
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

Make sure that open/stop with their calls to ivshm_net_run and
ivshm_net_do_stop do not race with ivshm_net_state_change that runs in
workqueue context. Add a separate mutex with this so that state changes
can be completed independently of rtnl_lock.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 drivers/net/ivshmem-net.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ivshmem-net.c b/drivers/net/ivshmem-net.c
index c4821b80aec8..1b22b1cc5ea3 100644
--- a/drivers/net/ivshmem-net.c
+++ b/drivers/net/ivshmem-net.c
@@ -30,6 +30,7 @@
 
 #define DRV_NAME "ivshmem-net"
 
+#define IVSHM_NET_STATE_UNKNOWN		(~0)
 #define IVSHM_NET_STATE_RESET		0
 #define IVSHM_NET_STATE_INIT		1
 #define IVSHM_NET_STATE_READY		2
@@ -88,6 +89,7 @@ struct ivshm_net {
 
 	struct napi_struct napi;
 
+	struct mutex state_lock;
 	u32 state;
 	u32 last_peer_state;
 	u32 *state_table;
@@ -575,6 +577,15 @@ static void ivshm_net_state_change(struct work_struct *work)
 	struct net_device *ndev = in->napi.dev;
 	u32 peer_state = READ_ONCE(in->state_table[in->peer_id]);
 
+	mutex_lock(&in->state_lock);
+
+	if (peer_state == in->last_peer_state) {
+		mutex_unlock(&in->state_lock);
+		return;
+	}
+
+	in->last_peer_state = peer_state;
+
 	switch (in->state) {
 	case IVSHM_NET_STATE_RESET:
 		/*
@@ -594,9 +605,13 @@ static void ivshm_net_state_change(struct work_struct *work)
 			ivshm_net_init_queues(ndev);
 			ivshm_net_set_state(in, IVSHM_NET_STATE_READY);
 
+			mutex_unlock(&in->state_lock);
+
 			rtnl_lock();
 			call_netdevice_notifiers(NETDEV_CHANGEADDR, ndev);
 			rtnl_unlock();
+
+			return;
 		}
 		break;
 
@@ -622,15 +637,12 @@ static void ivshm_net_state_change(struct work_struct *work)
 		break;
 	}
 
-	virt_wmb();
-	WRITE_ONCE(in->last_peer_state, peer_state);
+	mutex_unlock(&in->state_lock);
 }
 
 static void ivshm_net_check_state(struct ivshm_net *in)
 {
-	if (in->state_table[in->peer_id] != in->last_peer_state ||
-	    !test_bit(IVSHM_NET_FLAG_RUN, &in->flags))
-		queue_work(in->state_wq, &in->state_work);
+	queue_work(in->state_wq, &in->state_work);
 }
 
 static irqreturn_t ivshm_net_int_state(int irq, void *data)
@@ -663,17 +675,27 @@ static irqreturn_t ivshm_net_intx(int irq, void *data)
 
 static int ivshm_net_open(struct net_device *ndev)
 {
+	struct ivshm_net *in = netdev_priv(ndev);
+
 	netdev_reset_queue(ndev);
 	ndev->operstate = IF_OPER_UP;
+
+	mutex_lock(&in->state_lock);
 	ivshm_net_run(ndev);
+	mutex_unlock(&in->state_lock);
 
 	return 0;
 }
 
 static int ivshm_net_stop(struct net_device *ndev)
 {
+	struct ivshm_net *in = netdev_priv(ndev);
+
 	ndev->operstate = IF_OPER_DOWN;
+
+	mutex_lock(&in->state_lock);
 	ivshm_net_do_stop(ndev);
+	mutex_unlock(&in->state_lock);
 
 	return 0;
 }
@@ -939,6 +961,9 @@ static int ivshm_net_probe(struct pci_dev *pdev,
 
 	in->peer_id = !id;
 	in->pdev = pdev;
+	in->last_peer_state = IVSHM_NET_STATE_UNKNOWN;
+
+	mutex_init(&in->state_lock);
 
 	ret = ivshm_net_calc_qsize(ndev);
 	if (ret)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/04d10f9e-9e04-ad4b-a3e6-399f84b2ecb7%40siemens.com.
