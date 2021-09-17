Return-Path: <jailhouse-dev+bncBC6IJHNSTEHRBSM3SCFAMGQEW2PU3IQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D140F072
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Sep 2021 05:38:51 +0200 (CEST)
Received: by mail-pj1-x103a.google.com with SMTP id r13-20020a17090a4dcdb0290176dc35536asf6403571pjl.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Sep 2021 20:38:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1631849930; cv=pass;
        d=google.com; s=arc-20160816;
        b=w11vRNYztwE25Rk8pWRa8vn3PT0dWl/TE9a1uk369RFg51b7yz2qmIjR1Fg8DkCXo2
         h32uC366M1IRqTnDtEGHW7nQ1qCKOd5QWxftSadzbFabxNScBa2K1coHLem137hbqwND
         HLacLC9M85LyswEUaRAM4rEZIFkgxS+JbauTvODfskF99XyIIMDjMXjfy/dZEMWENhhW
         CJbUSWka5wE/0MqCMJSiIbKdsaSkkQN1xmd+DMVKObqYTZTzWa39FU7nE4EBLaw1Uw9k
         O351XbyTwnDWBimV/TxEE/QQ7q+LfiCInWJI1T21MOwRZBPI/q2LWmQm+NUi/5XjL7NI
         FDBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version:references
         :in-reply-to:subject:to:from:date:sender:dkim-signature;
        bh=yc/28FAJJmyxkbAvGNU4N35u+e1Dzuh5WtYWxxgSbxw=;
        b=DZLWk9Lc62bHF2stcFpINwq/iGaK+QDGw5GcqZi7pzF8Fa86iWhZtaOmlVpQ+QibTv
         y22g+VFNo8mbXFzthEZGcfGShe3a8VOliJKQCeUYfm7qOayJDOLTJxucVfsoX7mVoc1W
         O+CWPjVM9ZHrj8NW5ctUDjJ1e+gwTlLxwxl/pW+bfPJT3qzY1JtZGaKqKMFs7J0MfV/C
         y63uJGTWDsSkCY+sq2HCObrKSrIYPQbR1VKKBimjZlGEz2WjA0wlvhDHtFRI+nNyooHb
         bJnukWZkSBszFC+Q0/F1cWIipSw9NRGu/pznDFZG+Ym4BXyQ3Z2sN5OlQ9Y848CPQs/l
         mbqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=G3DImmaK;
       spf=pass (google.com: domain of consingdj@163.com designates 220.181.13.103 as permitted sender) smtp.mailfrom=consingdj@163.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:subject:in-reply-to:references:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yc/28FAJJmyxkbAvGNU4N35u+e1Dzuh5WtYWxxgSbxw=;
        b=gouCFo7UjXgkdc3kZTB7AdmfCY1DeytIOlwGDLoCbIDSBJJlJUhybI5YgkIW3ueql2
         WXNyHBqWus5PgYK3cdpwlfplKidFuSJneYtQY4SFfnnoUc6FIiXoVsyw3u64oAHcpESm
         iXl3ZssbFHF6zKYQF5KCVXb6GYTVAIiCdX7gf/2zyBNe20ZTglo1z5mA7BKgn/Wt2F28
         qxNvSL3rlg+eXM2ervxvr/3oJ84xPRz2Vi14A8zQnQqocMZZapeWfsseSyP6fojlG+QA
         p4ZTfxaG+MpDN0GhhZehux7S1962tLfzQE3smy+YwV/xVd0wK1Ln/MDma99bL3pcP4Y1
         8Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:subject:in-reply-to
         :references:mime-version:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yc/28FAJJmyxkbAvGNU4N35u+e1Dzuh5WtYWxxgSbxw=;
        b=ViOM0ofh5RXwgW9GtBfl+QRiX522OOoGi+doba7b5r3+yD59HbiuKrgLO+Fwa36rMS
         CIflSfq0QItacN02yZxnzG6S+2OT/ju49k//K6AgEdqqyzaQ7sUFoIx/1l+zQoKJQW9X
         poTsv2xU0zKhAFslzh8WRr8vHJK1gB4qpIfhyc/24jM8bMDYlGflKtAHInQAtA1meZnu
         3Ed8GzHEUMkukswOJ+tvA1Bay1OHU1WH6JSkbNpPEVa8e0TEGSDDoPkEVz6QUZBbeTUt
         KQaIhTfkjFoILCsNDRM4qdeaNS6aEFV9A32vKhtDb6f0snfUbq2kmGTHozLrwh/k9uME
         Y8aA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532jR8rAXOj153WrLn7mywi9m5IJ/Ys7boGUIhzAj7WI2ZJa8Tb/
	C7BXRmnA2XpgyH+fC9RhHTY=
X-Google-Smtp-Source: ABdhPJyE/7p03UpM2aVLAKYCItq1jcAoRjvofhKpymUMgvPv3tJL7fy+f8Qx/0urlc03cijoIEIAEw==
X-Received: by 2002:a62:bd06:0:b0:43d:e21e:f48 with SMTP id a6-20020a62bd06000000b0043de21e0f48mr8581212pff.46.1631849929961;
        Thu, 16 Sep 2021 20:38:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:2cd8:: with SMTP id s207ls2414594pfs.11.gmail; Thu, 16
 Sep 2021 20:38:49 -0700 (PDT)
X-Received: by 2002:a63:790b:: with SMTP id u11mr7864761pgc.71.1631849929292;
        Thu, 16 Sep 2021 20:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631849929; cv=none;
        d=google.com; s=arc-20160816;
        b=q++6Sifn32UFHyM363bfaQpmbqEzlnq3kSOR84FewtqHGCVwhfl7EbSp7XuX66tJ+C
         Kncyg1ndsBGIRSOJAHGaIg9fExBNnLSFeZOYxQPHoaJ7+slwCNFWIOBCgN3V0+5wcN17
         HJOwlJCJTVVIKMw/SQkCZuxl4YbDNHJhdWNQUo52aVughcSbakYGThp3lOYmYgnzL/Ry
         yMg0QTQAZ8pu7tI5Y/CvFgMv13LO4YxL04bomKSv3c7Y5lp20EQXNOSFb4xP0J92jzS2
         oy3nIYOy1IBHvbKPYahXSsdXHYyrOmiwgAVQMZ9sFqfP8Zn36z/M3EY21aWXwi4liP1c
         NW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:references:in-reply-to:subject:to:from:date
         :dkim-signature;
        bh=zuvrLx22PltRlFTnHBEXSgviIgoInZS+GTIy470dyvk=;
        b=Uv5MH0K/7T61EYj0BgSdZpnpq1LfQ3oprNpUc4+ZYNxd8CYuZTKijEezONg2Q5jY9o
         kHPXJ7bpBYQLYY3iWnJE+pYB/e1p18K1512w5SnHIbs+LMszeitlIHJnL1OI20AjKqU2
         4VQzmpPh0ruTRx4Dh2gZGsMMfFQebM+GFHA2FEkit/CCmeqRcpSJ17qDAO/cKvLHbiWW
         B98cS/uF4RrPI5WrWMK4vjTzDYo46WBbOYMjwoHDKw2OeXvxd3Uuydv8cGMFYVykVSLD
         BoXmo5UQ/S0qpZSl8UUjNDiAP2MDMkQvfmJzeTRgEx5xs9PDmslDwzlj+xzF07+T3vfs
         bjwQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=G3DImmaK;
       spf=pass (google.com: domain of consingdj@163.com designates 220.181.13.103 as permitted sender) smtp.mailfrom=consingdj@163.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from m13103.mail.163.com (m13103.mail.163.com. [220.181.13.103])
        by gmr-mx.google.com with ESMTP id m1si779226pjv.1.2021.09.16.20.38.48
        for <jailhouse-dev@googlegroups.com>;
        Thu, 16 Sep 2021 20:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of consingdj@163.com designates 220.181.13.103 as permitted sender) client-ip=220.181.13.103;
Received: from consingdj$163.com ( [140.205.147.93] ) by
 ajax-webmail-wmsvr103 (Coremail) ; Fri, 17 Sep 2021 11:38:27 +0800 (CST)
X-Originating-IP: [140.205.147.93]
Date: Fri, 17 Sep 2021 11:38:27 +0800 (CST)
From: "Dongjiu Geng" <consingdj@163.com>
To: p-yadav1@ti.com, jailhouse-dev@googlegroups.com, lokeshvutla@ti.com
Subject: why call arm_smmu_sync_ste_for_sid() two times for
 arm_smmu_write_strtab_ent() in smmu-v3.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
In-Reply-To: <2d772a63.185d.17bf1d1b525.Coremail.consingdj@163.com>
References: <2d772a63.185d.17bf1d1b525.Coremail.consingdj@163.com>
X-CM-CTRLDATA: xs0LB2Zvb3Rlcl9odG09MTkwNzo1Ng==
Content-Type: multipart/alternative; 
	boundary="----=_Part_23202_158881217.1631849907021"
MIME-Version: 1.0
Message-ID: <63c89745.18cf.17bf1d5834e.Coremail.consingdj@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: Z8GowAAnL9uzDURh2g3TAA--.15224W
X-CM-SenderInfo: 5frq2xhqjgyqqrwthudrp/1tbiIBURrV0TFc7fngACsf
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Original-Sender: consingdj@163.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@163.com header.s=s110527 header.b=G3DImmaK;       spf=pass
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

------=_Part_23202_158881217.1631849907021
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/63c89745.18cf.17bf1d5834e.Coremail.consingdj%40163.com.

------=_Part_23202_158881217.1631849907021
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div style=3D"line-height:1.7;color:#000000;font-size:14px;font-family:Aria=
l"><blockquote id=3D"isReplyContent" style=3D"PADDING-LEFT: 1ex; MARGIN: 0p=
x 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><div style=3D"line-height:1.7=
;color:#000000;font-size:14px;font-family:Arial"><div style=3D"line-height:=
1.7;color:#000000;font-size:14px;font-family:Arial"><p style=3D"margin:0;">=
<span style=3D"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-=
serif; font-size: small;">Hi,</span><br style=3D"color: rgb(34, 34, 34); fo=
nt-family: Arial, Helvetica, sans-serif; font-size: small;"><span style=3D"=
color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-siz=
e: small;">&nbsp; &nbsp; &nbsp;Sorry for the noise, when set/change STE, wh=
y it need to call arm_smmu_sync_ste_for_sid() two times using diferent&nbsp=
;</span><span style=3D"color: rgb(34, 34, 34); font-family: Arial, Helvetic=
a, sans-serif; font-size: small;">dst[0], as shown below.</span></p><div st=
yle=3D"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; f=
ont-size: small;"><span class=3D"sewd7a5waclk6yz"></span><span class=3D"sew=
d7a5waclk6yz"></span><br><br>static void arm_smmu_write_strtab_ent(struct a=
rm_smmu_device *smmu, u32 sid,<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; u64 *guest_ste, u64 *dst, bool bypass,<br>&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u32 vmid)<br>{<br>&nbsp; &nbsp; &=
nbsp; &nbsp; .....................<br>&nbsp; &nbsp; &nbsp; &nbsp; arm_smmu_=
sync_ste_for_sid(smmu, sid);<br>&nbsp; &nbsp; &nbsp; &nbsp; dst[0] =3D val;=
<br>&nbsp; &nbsp; &nbsp; &nbsp; dsb(ishst);<br>&nbsp; &nbsp; &nbsp; &nbsp; =
arm_smmu_sync_ste_for_sid(smmu, sid);<br>}</div></div></div><br><br><span t=
itle=3D"neteasefooter"><p>&nbsp;</p></span></blockquote></div><br><br><span=
 title=3D"neteasefooter"><p>&nbsp;</p></span>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/63c89745.18cf.17bf1d5834e.Coremail.consingdj%40163=
.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/ms=
gid/jailhouse-dev/63c89745.18cf.17bf1d5834e.Coremail.consingdj%40163.com</a=
>.<br />

------=_Part_23202_158881217.1631849907021--

