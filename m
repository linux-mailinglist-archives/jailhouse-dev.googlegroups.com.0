Return-Path: <jailhouse-dev+bncBDNMVMWAZ4FRBQOWYOJAMGQEVKAIFUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6724FA191
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 Apr 2022 04:11:14 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id bp13-20020a056512158d00b0044a7966d6basf3531281lfb.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 Apr 2022 19:11:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1649470274; cv=pass;
        d=google.com; s=arc-20160816;
        b=0RdLb1J15QvoDsB9XhJ4urqUe+D4jke8N3sz7Pkc48YUlGAKIU4y0wqtp8HhzdNcHI
         tDZCyojtQbQw7RqPHJUy81wlUyKRMSTBKE0ov3vOYiqp8jXb9BWzgjW38UF4z3+mPykG
         yOD9n143DZgufmbtEI792x/tUr6jt46Dqu/XgQ0Bewmj1x9mHYdREZy/dUznzyIr2N4s
         G4T0wxNMzbh29EQHwbPwGvPoDP7lVkDsnq3DN/Ap0iQJjCKxxlHg8lRBEtw89eq8U8cl
         EFYjWARZnGKI19En2RDjJwe2+aXZYhC8P7OR+ygR6wOo0GfW3e4JEB4XGHHH3K1rMhwq
         AFWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=hU3YyYUbZbK2g5/EugQzaUz6QvN7oVJ1lMolQ2RXDlg=;
        b=06hQrv+KFuzJr1Yunj1Z+0yT9XW8MK0PoAEd0hiemC1uIFB+egtsByql7hR96ntaPz
         RJarHbXmZonWaOp5eDT2ZEm234Rl+U5vJ0H7tf+CYiuUV7ZKcXcdJ5c3etz8Lf0BMyDK
         5PW3lR+R2VbFYcSphf3vL5JPYhcjaK6pJBaYUUqaeNwviqDfYL8VziEUD7/rZ5SnV2e0
         A9X1boRrwjPzoK1Njxzcj6HXwmdwe3XaJEP8PYgJBe3R6A+lpy/q6e2AH1gCF/wR05Q6
         JJXBf8E+0/zpJlIQxyGtiJs7mJZNg2RH85CKx3hMfks38NHqiAjebniLF1RTNiEmSH48
         WwzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=OflNmt1Y;
       spf=pass (google.com: domain of yhbczj@gmail.com designates 2a00:1450:4864:20::234 as permitted sender) smtp.mailfrom=yhbczj@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hU3YyYUbZbK2g5/EugQzaUz6QvN7oVJ1lMolQ2RXDlg=;
        b=Ti9ulzLG2HwBWnLGShP8OcR+tTIFLAB3YOH3D+vzlpC60PUoud7+m/NXUA2Jo8HZOz
         bqYUx0tTlaEhHwGNE0E1wjECRB/ZDGp0ge3/Tj51kW5ikg+4iZC/k4sCPhorO3VSqj5f
         /fT3mvaOvqziLeq19pQjtwHJ9bt6mw+B6KRt5jf6UZRLKncvE5BX8jNMSlVKISr/do7h
         unCLGz+lelZMIvGIxrH9ToQnPNNZLT6koHJdDbDJpZ8Swc3oPhqkjz3tZ0YCQBtsPuEV
         bAYtgWUnMZ2b4OimQ/+BQfpyvulZzSjdg+DgRGcWctrPjCgG1Xi0MKJqoGLL5LI8HDW9
         hKTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hU3YyYUbZbK2g5/EugQzaUz6QvN7oVJ1lMolQ2RXDlg=;
        b=beyS/15eAOT6/W0ewNzcAECSMx/vk7Sih/exzZg7SqUdjoJraqPuiv0A6B4g1ZAlYc
         1CmS05y9w1/4Qo8KlZCuY+G+QX8NtfgdUmm1yC7fntE+Fo6RrF4PW/ZZQL7JYhk3W8+z
         V9895xq2lnFGk0Wc7+aPMXDlUqXRtzw4umx9jsssZ2fUusETM30mdM3jVR5t/USMyPPW
         7v1XnTsmVkz2K8uAIV5ieUlgGiexXOo0jAk6Qyoo4k7tcCtFg9jVQAsMxbpl4pL76j3F
         fb4zA9BUBr5kq1I6EXf9a0jJdb2orH19uI3Mu++P5Wx8tzfWej8/9QHyOq0uEndV0xu+
         c4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hU3YyYUbZbK2g5/EugQzaUz6QvN7oVJ1lMolQ2RXDlg=;
        b=r8a3yquQnCXGEDBA0J+aVFI9XZ2TsU67vukkyL19gNsIIXiqIw52M9LqcwKM0+GwaD
         ioRCRRmdQx/R3RTE8LsCnYRAN4hFVt8UyGzLfqy/HEVEdGVD59TbxZVTI8bTfjddW69y
         QQj+wNlMWy4DcKqiMZrG901NabO3Hzct13k2O6KY2WhoOSUCbaLmkdEl/ZQM3hEBv4OJ
         whnep77TKQD2kpoNo76gBzHMe/PHZagvR1i7ckR2ohVn4JDYgn8r+kohvw7G3RfUk/HV
         nGa8Hk8I6bZ3UkMmBL5zyKOM1HKTdGzCgIXnSdg4lOP7+pf/5Ymbw5vW2Udir05fDu5u
         2Gxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531OS8kmD2c9+dgpvXEFDwTjHxI9QmoQZTHqJAJhiM9z8uFv7C16
	6+/K6dGtDupWzXrCfCk3XqA=
X-Google-Smtp-Source: ABdhPJw1uLLWlCi3gwLArl4By6Jw94LoZBPECa1z9xlFdFKy4jrYEKZAJSsFhIo7/ovEAOpjBrqlSw==
X-Received: by 2002:a05:6512:b19:b0:44a:e328:7304 with SMTP id w25-20020a0565120b1900b0044ae3287304mr14100260lfu.452.1649470274211;
        Fri, 08 Apr 2022 19:11:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls2628619lfb.1.gmail; Fri, 08 Apr 2022
 19:11:12 -0700 (PDT)
X-Received: by 2002:a05:6512:250b:b0:46b:8fc7:9ecd with SMTP id be11-20020a056512250b00b0046b8fc79ecdmr1117264lfb.122.1649470272566;
        Fri, 08 Apr 2022 19:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649470272; cv=none;
        d=google.com; s=arc-20160816;
        b=nhmnlxbl2Xrn/U8IYSn4wNpTqEn0gIKc78uZx6X6Zzri9efxFgoTJKyE1csd9T+An4
         dHHwnw7Wgbp/UKcaYAg3w0uoxFy/HG1B0m8fG0CEagochzQy6JvsSOyOu4Pw50LqqWR8
         jbcvFRbgCYjqovWP/RQFBNgNS9T7KFZO3TaWOx8t5R1rBnoeCgZLxKacgmpaqXLDr+4n
         GL0VhIhH3NX/FJ3Al6doYQBls2DFtU1tZr6opgZ3AlKHwg5+Mzvb+XouOriiV3o8/iSe
         eRKvMLCQpAeWWFWKhRw+0rT4Q84rmtsEyrCLjFVTRU+FcQ7PCx+2I6c8iC5prIpNZslT
         DV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IJkEZWBOGN8GlvDiu9kaoFOK1Ikr8ieQSS4e8zJSzE8=;
        b=FKRjXbyWROOcQdp3WYCPMlbRMakfkfrPk4+wtleI0Hu4Drfs+u/rnsmcFWswsR+Itg
         2NAYnYlkGwZgU+jaLXRLv3QXUX8/yVGf24CfBdMmElxmE3kckfvuV5+D2V8jwjCZu4N4
         yfZcGY99AXBgvSahdGbUwOrOzuFoHsXe/ko9PlLh4DHw626PGEkqD4c/4UgiyjlzuQza
         y1FXJzPHHq6AftJW/CR3en+bEcKzej85POMTSeJKWteJdgdqKbFe1GTwnpF5ofxsauMb
         DJAwuTje9KQD3SDjCi1vp30Tw9RO65Cwxqba5AqLTQ2S+IMxNeRhcvWJWW+297r7M1RT
         C/Gw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=OflNmt1Y;
       spf=pass (google.com: domain of yhbczj@gmail.com designates 2a00:1450:4864:20::234 as permitted sender) smtp.mailfrom=yhbczj@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com. [2a00:1450:4864:20::234])
        by gmr-mx.google.com with ESMTPS id w14-20020a2e9bce000000b00244e301795fsi97049ljj.2.2022.04.08.19.11.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 19:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of yhbczj@gmail.com designates 2a00:1450:4864:20::234 as permitted sender) client-ip=2a00:1450:4864:20::234;
Received: by mail-lj1-x234.google.com with SMTP id a30so13538149ljq.13
        for <jailhouse-dev@googlegroups.com>; Fri, 08 Apr 2022 19:11:12 -0700 (PDT)
X-Received: by 2002:a2e:2f06:0:b0:249:8f0e:cbcd with SMTP id
 v6-20020a2e2f06000000b002498f0ecbcdmr13248007ljv.145.1649470272066; Fri, 08
 Apr 2022 19:11:12 -0700 (PDT)
MIME-Version: 1.0
From: hubin yang <yhbczj@gmail.com>
Date: Sat, 9 Apr 2022 10:11:01 +0800
Message-ID: <CAD47rNQALFv6GNYbP-W8HgDpzpTGdGtL2xtONURepiGxtK28vg@mail.gmail.com>
Subject: 
To: jailhouse-dev@googlegroups.com, jan.kiszka@siemens.com
Content-Type: multipart/alternative; boundary="000000000000a2571405dc2f39db"
X-Original-Sender: yhbczj@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=OflNmt1Y;       spf=pass
 (google.com: domain of yhbczj@gmail.com designates 2a00:1450:4864:20::234 as
 permitted sender) smtp.mailfrom=yhbczj@gmail.com;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000a2571405dc2f39db
Content-Type: text/plain; charset="UTF-8"

Hello everybody,

i want to remap memory region for a cell when its image has been loaded.
for example, the virtual address 0 was mapped to physical address
0x3fa0_0000,
now, i want to remap it to physical address 0x3000_0000.

how to do that?

Thank you in advance,
Hubin

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD47rNQALFv6GNYbP-W8HgDpzpTGdGtL2xtONURepiGxtK28vg%40mail.gmail.com.

--000000000000a2571405dc2f39db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everybody,</div><div><br></div><div>i want to r=
emap memory region for a cell when its image has been loaded.</div><div>for=
 example, the virtual address 0 was mapped to physical address 0x3fa0_0000,=
</div><div>now, i want to remap it to physical address 0x3000_0000.</div><d=
iv><br></div><div>how to do that?<br></div><div><br></div><div>Thank you in=
 advance,<br>Hubin<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD47rNQALFv6GNYbP-W8HgDpzpTGdGtL2xtONURepiGxtK28v=
g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAD47rNQALFv6GNYbP-W8HgDpzpTGdGtL2xtONURepi=
GxtK28vg%40mail.gmail.com</a>.<br />

--000000000000a2571405dc2f39db--
