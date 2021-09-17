Return-Path: <jailhouse-dev+bncBC6IJHNSTEHRBU4ZSCFAMGQEYMYGO5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf40.google.com (mail-qv1-xf40.google.com [IPv6:2607:f8b0:4864:20::f40])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B2540F06E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 05:34:45 +0200 (CEST)
Received: by mail-qv1-xf40.google.com with SMTP id z6-20020a056214060600b0037a3f6bd9absf84725015qvw.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Sep 2021 20:34:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631849684; cv=pass;
        d=google.com; s=arc-20160816;
        b=m70XMfbpNrLH335I7ViywJfV3yNCz2PcdL5eSr12bwToRsK2uTjn6siQoCNqx7h/iV
         CYzqlskb1HHxIqHeJxJyfajXH/+7xcOjSO0sOrvsD1+qotl/AjX+upX+fnTGP/rPPTRZ
         i0LDZBFAw4H7cWHs04t90AMqn4CUggVe+u+tF6pcIRRy1ma2ACFoTC1mCgD43BucV8QL
         6vsndScdw/pfcBXKUJTKGix2rcx5fbG39+vABGAuEfgY5FNe1++6wMYhbg05K3W1QpQV
         YnSIFydb3TyDjh3mVjbW0xBdqILtK5mP/pL+hUE4Co1rlATU+MzdCklwMBJLN3eQUYKF
         mw9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version:subject:to
         :from:date:sender:dkim-signature;
        bh=/RzpX40yo56Z1beyORJtTJSxdbZs+8T6ChGSrCZw7j4=;
        b=eclRpU/AQTySvG2W0NrB0L6lHaw7+6qD0v7c8jxY/tvdok7/6DrX7fC9i/nnYAJjgR
         AkpPjg1h+gY3huhoRx45Eic0wsBm42GySbWwvK6BL1I6AcGUsNmyD29X27a/AlfA8rsB
         bOq2t4XRVWj4vqEm0Ido8JQC/y8hW0CzBThsizZdWs7ViLvzSq2WNr+WCVYh+TKQsNZJ
         gzeBVhDzImXhihBoGYxXF9AY2tUi+MwDOwB7fjwnaWpMUZYLZcA5FYuLpWXMp7se6Scx
         SNZGhaKvQv7ykSkuR5+SKjawLFGVmGRNoDK7MncCCsSWckVxu98mUmzVmLV3gdXhIGmA
         1vzQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=S1+LFOwK;
       spf=pass (google.com: domain of consingdj@163.com designates 220.181.13.103 as permitted sender) smtp.mailfrom=consingdj@163.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:subject:mime-version:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/RzpX40yo56Z1beyORJtTJSxdbZs+8T6ChGSrCZw7j4=;
        b=W6VwK7yL44KcUjvRRI3Fiw4nb8C9rtQqjjlBQ1Q60MHzd1UYLMq5gWWqK7muyiJhKg
         U663gP1Bxui2gIuo3xUkMSZxv/jVwI1Vl2bv6lmEkYpW/HLuaSLbDznFmwqA6iOm3yJc
         Soj6uYR5OtkbqNDQ5Km3+9Z8lSlQo0vjxCy5iRYAOylXrV+p6V8tvC5Oe3EnxbHjrOWV
         C6511wkwNVS9dBw/Z/23/zH+DFl2GsL1TeEz3SUMJ6M82H3Ld2ihUGhIdoMClZs7ENmM
         FKkL6ZAwJdh7E3cIpWPtsVL/O3hNwMK4hljITPO1qGgNSLYc4CYXDuxI9xwpulp2xNVx
         oqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:subject:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/RzpX40yo56Z1beyORJtTJSxdbZs+8T6ChGSrCZw7j4=;
        b=Q/08mxrYQYp/NglVNdMgaSIrAOjxw6nd7AvpnyPnufLdhAPb1xdrkF1+vrexbau4TL
         aFy1wPMlAp81vzfwlGCBpDcXC6WwAfCFkRPKs/gzLA1u0vZOuCidh0DZlmEyf7PHEwbN
         tDQlfLYKH1cm4TGl+m8eJgn0l65L6bPitEo0UhuLz652AMmHI9Fno/8Wc2roGltenSO9
         oyL5m07w7rO8GABJ13Ho8OLt7Tst2+B9ufZU043SbVMOy/Pj/ElAYid8v0j1QDVjwjnM
         Jx2w7fKzUR/Y4jV/ww6WSUaanQmKLF7TcSbuu9RjUt/DbNwB0fsGKDI2J1TIjpnPwenZ
         VBbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531gz8AofkKWUt1lpqCga5RLjQaAWV09hAgUYn9LH+2GeHofZRwW
	6OROaVUd33i+ZJ92k6rxDCM=
X-Google-Smtp-Source: ABdhPJwELKaW35SAl5FZYr/QSjSfL0CO0sPRceLZD+ry89hyxWR5iW5hLiUZEX3WLOMjV4lIGnmhWg==
X-Received: by 2002:a05:622a:48d:: with SMTP id p13mr8754440qtx.282.1631849683880;
        Thu, 16 Sep 2021 20:34:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:e303:: with SMTP id v3ls7084887qkf.5.gmail; Thu, 16 Sep
 2021 20:34:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2298:: with SMTP id o24mr8715344qkh.235.1631849683355;
        Thu, 16 Sep 2021 20:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631849683; cv=none;
        d=google.com; s=arc-20160816;
        b=nN1mgq561gYCSoH7563SjcEw42mGoDaoymVZCi2NMGIZZryyqmqKe0LuzutOdzBjyr
         j12RyZwdDs+CUP1K4BoOUcry/9j46tfsourzmqtVAzeKl3crZ2WVRTUBevpla3PkBOnQ
         /mHuf1m/aESsxv22XhlQnDSyilok8RO5xa7dJQ9UROsjeHFqoOd1Oh/Q+KlLbgOk+B20
         r0M8MMsaEiEkpX0Jh+BYg1v+xYx7gODm1+UyJ+z8FqT38/wNbJfSJbiC31d5UdoBFhXX
         RTlMsUlrKjQcrATsCjsPQ1U7AeE3O5qEHKXqvA0P3UmPOVDRLNf9iz1pAMt5KPTwGrT1
         353A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:subject:to:from:date:dkim-signature;
        bh=t3U/j1Sm5cf6vnRgvk/s8aLnnXGysjmBbEjxKX65RoE=;
        b=lwDBJY30nOS4x7ezQlL7o3aYOwsFynUoaf1OLGnxsu1NQarXsGnFtFJCrsEObcNrlj
         ll/mm55MS9KsL0B5Jnxbf/g8NgUnF3ruZZxrKjlBA4mbKrrcf7/XR5Flx46mTjBUU6BV
         Hkr5y3/jurj8NJ3lpeVqbW0eqXGBuamnUxAiGhxE3nV+bpeMuJjgMOrtDpJ7ip1sC/sp
         d3N1K41RrGviBEA6WFQ+skB1LH0OvTLEFRkShN2K3bMEIaAxuOr8LSi89d7BvEt8xM1Y
         a3zhhgkp94D4jC8LdyocfLczUSlpf1XWcUR1Ahox+XeD8iQJJMv1pJkPoFs3VzioCZd6
         sy9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=S1+LFOwK;
       spf=pass (google.com: domain of consingdj@163.com designates 220.181.13.103 as permitted sender) smtp.mailfrom=consingdj@163.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from m13103.mail.163.com (m13103.mail.163.com. [220.181.13.103])
        by gmr-mx.google.com with ESMTP id q27si1095402qtl.0.2021.09.16.20.34.42
        for <jailhouse-dev@googlegroups.com>;
        Thu, 16 Sep 2021 20:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of consingdj@163.com designates 220.181.13.103 as permitted sender) client-ip=220.181.13.103;
Received: from consingdj$163.com ( [140.205.147.93] ) by
 ajax-webmail-wmsvr103 (Coremail) ; Fri, 17 Sep 2021 11:34:17 +0800 (CST)
X-Originating-IP: [140.205.147.93]
Date: Fri, 17 Sep 2021 11:34:17 +0800 (CST)
From: "Dongjiu Geng" <consingdj@163.com>
To: p-yadav1@ti.com, jailhouse-dev@googlegroups.com
Subject: why call arm_smmu_sync_ste_for_sid() two times for
 arm_smmu_write_strtab_ent() in smmu-v3.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
X-CM-CTRLDATA: /3azWmZvb3Rlcl9odG09MTY0Mjo1Ng==
Content-Type: multipart/alternative; 
	boundary="----=_Part_22779_333583130.1631849657637"
MIME-Version: 1.0
Message-ID: <2d772a63.185d.17bf1d1b525.Coremail.consingdj@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: Z8GowAB3oji5DERhMA3TAA--.52025W
X-CM-SenderInfo: 5frq2xhqjgyqqrwthudrp/1tbi-BkRrWB0G2gHtwAAsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Original-Sender: consingdj@163.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@163.com header.s=s110527 header.b=S1+LFOwK;       spf=pass
 (google.com: domain of consingdj@163.com designates 220.181.13.103 as
 permitted sender) smtp.mailfrom=consingdj@163.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=163.com
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

------=_Part_22779_333583130.1631849657637
Content-Type: text/plain; charset="UTF-8"

Hi,
     Sorry for the noise, when set/change STE, why it need to call arm_smmu_sync_ste_for_sid() two times using diferent dst[0], as shown below.



static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
                                      u64 *guest_ste, u64 *dst, bool bypass,
                                      u32 vmid)
{
        .....................
        arm_smmu_sync_ste_for_sid(smmu, sid);
        dst[0] = val;
        dsb(ishst);
        arm_smmu_sync_ste_for_sid(smmu, sid);
}

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2d772a63.185d.17bf1d1b525.Coremail.consingdj%40163.com.

------=_Part_22779_333583130.1631849657637
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"line-height:1.7;color:#000000;font-size:14px;font-family:Aria=
l"><div style=3D"line-height:1.7;color:#000000;font-size:14px;font-family:A=
rial"><p style=3D"margin:0;"><span style=3D"color: rgb(34, 34, 34); font-fa=
mily: Arial, Helvetica, sans-serif; font-size: small;">Hi,</span><br style=
=3D"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font=
-size: small;"><span style=3D"color: rgb(34, 34, 34); font-family: Arial, H=
elvetica, sans-serif; font-size: small;">&nbsp; &nbsp; &nbsp;Sorry for the =
noise, when set/change STE, why it need to call arm_smmu_sync_ste_for_sid()=
 two times using diferent&nbsp;</span><span style=3D"color: rgb(34, 34, 34)=
; font-family: Arial, Helvetica, sans-serif; font-size: small;">dst[0], as =
shown below.</span></p><div style=3D"color: rgb(34, 34, 34); font-family: A=
rial, Helvetica, sans-serif; font-size: small;"><span class=3D"sewd7a5waclk=
6yz"></span><span class=3D"sewd7a5waclk6yz"></span><br><br>static void arm_=
smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,<br>&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u64 *guest_ste, u64 *dst, bo=
ol bypass,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32=
 vmid)<br>{<br>&nbsp; &nbsp; &nbsp; &nbsp; .....................<br>&nbsp; =
&nbsp; &nbsp; &nbsp; arm_smmu_sync_ste_for_sid(smmu, sid);<br>&nbsp; &nbsp;=
 &nbsp; &nbsp; dst[0] =3D val;<br>&nbsp; &nbsp; &nbsp; &nbsp; dsb(ishst);<b=
r>&nbsp; &nbsp; &nbsp; &nbsp; arm_smmu_sync_ste_for_sid(smmu, sid);<br>}</d=
iv></div></div><br><br><span title=3D"neteasefooter"><p>&nbsp;</p></span>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2d772a63.185d.17bf1d1b525.Coremail.consingdj%40163=
.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/ms=
gid/jailhouse-dev/2d772a63.185d.17bf1d1b525.Coremail.consingdj%40163.com</a=
>.<br />

------=_Part_22779_333583130.1631849657637--

