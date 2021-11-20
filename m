Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXXN4SGAMGQEOT2UT4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 397CF457FEF
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 18:56:47 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id u20-20020a056512129400b0040373ffc60bsf8936477lfs.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 09:56:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637431006; cv=pass;
        d=google.com; s=arc-20160816;
        b=YecBvW2vx6yPSW4HkDRDbUQQLNnWOVfcgGEtqfj9DSZFAouKMpfO+nkKb3pngfdS3o
         9xSQJlXK77ubmrKBMgznVBPp7HBFCko+nSMiBQRfk8E1Rpf3aggTEqKi1XrimF+THPDl
         DxVzkL0HnO3CoCx0WoltqJ6TJJXd6dkiYnZZUhA+J9oUwswTe1b81kdI16KSpqtojW8R
         W9ZF25hMRJTbgqlENullMpT5E/pMxFRE8v84dcUmho6SSfp1fqTb+NtmdDs98+ohxcS2
         8bKDKGt8ulFb/FjfLKaxxRitJ0KHAQhADsIew0EnkUMv4uIRVAH2SNe7xmslLSQ/EGgi
         TpMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=KUaJtQw5gmKxRP78aqvRwqskIT2yplfR2ciGnN2F28w=;
        b=UNHcOhnt0G7t7zq4/NjCoM6D5VCFkOzsKB9yQMdwdoF0NfDogMkHvDZH0PHWoQAu1j
         THCxdA87iUcwtYi4Iu3iOtoEWDo7+8wyBn/+c66d4D+8khWF5NdiKf8ew2MKQ3Pt8j/y
         /Cw6oRQnUyhibKw5ouE04E+7lGFow2TVsBT7Vj+cWC8aglOC45NBOg+VcwVgJCjzdCwV
         cycuBQ8WBeHBV17BpJnq2fVR7PkaHCv+DldVkQA/Aa/LIwCgIeMFOSHSicbImkLdYRk5
         qZc0ijVHw9fi+CYTZyKMaIsJ+sYXPV74DAFpb4KBaLdiW7XuOvnmdeoEOz8JKbK5S9Gd
         ILfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Sxt75e94;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KUaJtQw5gmKxRP78aqvRwqskIT2yplfR2ciGnN2F28w=;
        b=GFR9mX+hDmFwPMNkt6obi6hOIx5EEztFzDkwZs8/CQr7rYUWO8IPmkvjbG3PD45sM7
         3+PrpDRyI6y1T+adjEV417q+ttSkBGSIwIg8EO68hB6sn3zAiIEJr5CSqQ4ZH1Dm+4uB
         CpOT8n97nE+c4YPaseKrhDtBYmP4xXsHnGH0LEWi4AAlGU6ePeIlsUBopZaG9abywyb4
         NOioiLNd+Sln5OQEThrxJnjCvev8W699WSILg1bl3Cx8BawEY3BuCQMyDPJnGEv57rN4
         TENRdCN6gGy612DxET3hDG/q3G+WoR8jSr99eQlVPvCpP2fs4rsLgi/CqfezTs54CHiX
         uhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KUaJtQw5gmKxRP78aqvRwqskIT2yplfR2ciGnN2F28w=;
        b=L3gNbEXLRLcfLnePdL7Gkpzq0/IXiCY7RxyT3YzGph9+M8izR8veTodXXXU+sigfZR
         I9/+dSZUtqdU4zyIXilIIFxhdnZZZSHQVMx/WBeC7EZ8Gbzr/0tZAYYEbSm+xpYBuHTs
         c/cfrmgutKLAYTuj6xfhzlL5GgAlPQfjeTtVICxfKXSGv+kUhBupWU+USuczR8KnxnHU
         vaTcWJkC5BnNdhRVhc4Uga2AgNja6zF3c3XnfwqykvvCgwSrw0D39/uxzZN/2g8ZrO3Q
         QWPPB/O6b9mCqxmhgNiZpLUA9+B8WBjVJSsAovVsjmJEIDYGfEnzt29bnMriLareVhW+
         kN1A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533TeBz42aYqsv4IwgMxga/aKGWsWxl9RSmv1qN842lmR3K5la0+
	ZW8wky3nMLDQgBNS+7kL5Dc=
X-Google-Smtp-Source: ABdhPJx7EFT7ebnx8x714FtxL1MEt0gNarRgiFHfMtHrV6+JFI2CMfa0dS8H7+gLn3KPrLDTSJBFrA==
X-Received: by 2002:a2e:8156:: with SMTP id t22mr29376950ljg.223.1637431006656;
        Sat, 20 Nov 2021 09:56:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1687:: with SMTP id bd7ls379731ljb.10.gmail; Sat,
 20 Nov 2021 09:56:45 -0800 (PST)
X-Received: by 2002:a2e:bc1c:: with SMTP id b28mr37318153ljf.500.1637431005730;
        Sat, 20 Nov 2021 09:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637431005; cv=none;
        d=google.com; s=arc-20160816;
        b=P0W/zuwrgVpuQgd5a49bkcd1wJF0v9cUda7dDtuIFIurTN89PQw/6U/T3af/PKS7ig
         udDPXyMqg9C/XkQsRec9H04jwoZUkzxqJkMTUmQjur0gk8ZZ539hen/9fa8Fs/ppqoZV
         qr5uLwdWbKVzka35UaVtLmQSLL51KVWqfv6yctz9NVPqqfupOp4u7l5N/vbbSfEi4ZGH
         a4DilzE8rCVGTnG8+Z0DPgic77eEnPlUbkdvQddLsmMQ7QmbjcWrNHWQhXpZeSEUstRH
         IcQu5F6UtouOsU+pnGBDiQtzSyX7HpIHLSwu/4gurtq6ybSRn/RvDjYQoU9LU42e/S3Y
         CJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=qxloOo7n4JsGlX7G74IjsJNVsD6dbJLD03MchWCzFC8=;
        b=H5Oil5woxQ/4fLUWQ+Cq/ObzorVudPReE1+i+PDEr94zNCvEaDTgnybBXbYu1BEAgl
         eBdid9CjfRTjZ+7ywL+Ucku7lanJo94IzlmlUaUQ9rgeMM2lb6RgI49/i/jCdd9X+ITE
         0TUpp6Ix5b8Q33r/t5WHRzW820lAfIvFeXKKNb+PCovGrERcujOOjCYd9w53HyfT3WwB
         KHRC1VYmeVYiWy7iXyPQ5v1YoZN3dDFt+bFn0CmYaYpEmlJiDlyFPPx+4KCxcIQX14zU
         ZRrialsoDWmJU4Ys9bW7f4OFnoLDq8y1UNRD0lvwztP3TIGjnsI/QPfWgzTqGZZR4KiF
         Ik1w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=Sxt75e94;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id d18si216584lfg.3.2021.11.20.09.56.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 09:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.84.132]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MFs1z-1ms1FD3sQp-00HSfT; Sat, 20 Nov 2021 18:56:45 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [jh-images][PATCH 0/4] kas menu, Isar update, ccache, rpi4 rt kernel
Date: Sat, 20 Nov 2021 18:56:30 +0100
Message-Id: <cover.1637430993.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:wfXl4gryuv/PYbUHUPCxnoTDRsb9Ab876g2+O2WoFu5V3Hv8bPG
 KM5Cgd9JaO4Li9lMfBO1v2NVH7i6P+AIIamauWaobqRukAxKbwA0S5kknEvfuyOkGgtQukM
 ZvE8gSO+28rX6OzUMMuVlXWS4uX8RQaC1MXPL/opXW+nlbDugItigDqQdo24GlEweoaVhPI
 3A06/Vv6/AGpB8V+YEMug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/5aRiqqW0KY=:8BtXHANZStfAzIc+4B+Fck
 1iM1gYMU95R1BVtn/KmPR9g2iB+GmTi/7LfVHQVmAm/oTtRK78TP6eNkYNKZKSnF6aURLLzla
 u7hfF1m3/nw5QQelpHaFzii2arcI1Kw3LI2eEDwcGY6EHTOGNrpPcjQxShXsTdfcO8QPe+OHK
 vvmQYumZL/rrv58gVf6I9pBT8cuWTV3cHh2km2f+/O1H4KLtc4WXbkiu/xZ+ONAKEUCpwmZ0+
 QEKDuT3Y+w/Yt00/v2X3zJN2vKzh/vSNRLPqpgpFfZOiw3/2WDWM8bS8YLG2ZJZGiDJ+2VWsk
 A7xg+Zk0U3Od+hil77l794G1oJ7+FRxJc4amSUNAUcFsD4Fxc+WRKAXnzSP7EBfNgHIoVJzkj
 zApDsvdSID69+uYJme02b7OoNk18EjwyO9I1SB7xPwVoRmpt8wj3JVLYrrYC7TnvRZr+GiGoX
 MRJGz0BJgt9AXmI1Um+QpVP/IkUexSE3KER5kAD5WVA6eL9bCvvAH1paa9a1kbpjjsbQ59uM0
 Ca+zFfkP03ofsw0QLcrdx/ngCL+VKtQKZyOgTqJxjFgiLzhhBhemfui6bNMJL1FRh4OoEX3Bs
 Am7EP1U1pyofkyH/Uvipzb+ElUwFO6ouH/WZd7Qj/lPeml7kqwwoObBtiNYXIOo+dlAnbyEin
 Mw0dq84W3wli4wKsvvTXrj/y601OPcR9bXc2LQsFBuQYe0qqbP0fnthnAhmbPzLMxDfhlWkJS
 CLhQFemzWktqo0jphehVxUioQZYClM/I4pKUjj1ZAtWcVZWWtCzN8GvW9C0Xn/2vI8eZePInC
 bSr72XJ9SIoQvEeg3VruPc2wNiI4mxse5alhQXSmRmvoei87R5j9NqtE1Ch0kEcjPc7Mi7dX6
 pU6rsHm5vQJ91ko3RAjHtV2uxUkUx1WJaDNOYYM8gHn6a4frYSKBK7qtf1nttf/bZdPoNTwSW
 h5HU7Uyg8PngHt+2zk+Yu8qos1P7mzT5UYCPI9yS9Cqm3c1OGr/dEUbdcJY5Uh5nO29XKiHgQ
 /p7Fi/LIdFUVIvr+9ECmA8GnLVzqyN3njwucIqRJaGAFoupqwDk5SaGzNU9Bm5cnrfzYJF14g
 DG6VNOa/QpBLIg=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=Sxt75e94;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

See patches for details.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>

Jan Kiszka (4):
  rpi4: Allow real-time kernel build
  Update Isar, enabling ccache
  Update to kas 2.6.2
  Add kas menu support

 .gitignore      |   1 +
 .gitlab-ci.yml  |   9 ++-
 Kconfig         | 154 ++++++++++++++++++++++++++++++++++++++++++++++++
 README.md       |   6 +-
 build-images.sh | 102 --------------------------------
 images.list     |  13 ----
 kas-container   | 134 +++++++++++++++++++++++++++++++++--------
 kas.yml         |   4 +-
 opt-rt.yml      |   1 -
 9 files changed, 273 insertions(+), 151 deletions(-)
 create mode 100644 Kconfig
 delete mode 100755 build-images.sh
 delete mode 100644 images.list

--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1637430993.git.jan.kiszka%40web.de.
