Return-Path: <jailhouse-dev+bncBCWY74EX3IPRBA6736TQMGQE5BJGEUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43d.google.com (mail-pf1-x43d.google.com [IPv6:2607:f8b0:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id DA642793402
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Sep 2023 05:18:29 +0200 (CEST)
Received: by mail-pf1-x43d.google.com with SMTP id d2e1a72fcca58-68a4075f42fsf3701627b3a.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Sep 2023 20:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1693970308; x=1694575108; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19Nn13P3iUW51qI2qKUuLANRIoWV8VVq34NAbO9Gqgk=;
        b=neoKkh5JB/8v+5+0QTLrbqsE1SzYx75lqNmp7fsHThGgbp9iPext8IwE7t5GLfk07s
         B2nd8kRKequcN7sHphfODqufWpyWAvYeLa5lvIDMS2qCo5Gg+XdpjtoI3YhMN7lArvGR
         A7/XlNc7k9qAFiAg8Mz1g+jlKNlpVIjr8wkucs7sHgJqVqRfvZ8GwWar619NTWlxE1Wo
         v0NHZ1FKUgiPs78gWRZGp3YuE4fjQx4F/ei423AnHXFZM1ODqN++Hqtej3YloA5vjfUW
         UvxCzBs6AuyohrRtJzv9MT011Jn5g0d9tELfsn5JcyQrWNoXrmWWcAp8WbAjCT/BWbZE
         T7QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693970308; x=1694575108; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19Nn13P3iUW51qI2qKUuLANRIoWV8VVq34NAbO9Gqgk=;
        b=r24rtvdNmTtUwSW12R5Saa8oaRennbKTNXLF7K4amgH+gdqgW77QNDG7eGSRB9sgVV
         HvuGbnbM/HYQT0K8Jnwb4FbsPCoWodUVSDfBURLdT3GWD82VQAHLiaRe+nRn02duhcXc
         Ms5dlhEdGjw72fKY6AxLFpM0qKmz7SYdUPv1m9b+os5gCuaedTmylJ4aHCziaYkr6u5V
         P/O3ztHPK3NlVGQ+NuNyVwFeTzoRbN7MCzo0NVVIOaGToaI3NUMl+dBwp2sh35U8tEVN
         Exb2ZPUb4hMo9biEvmgPWd/05mbjnKJStj/BV7Md6TQBRM/cV20FVa+OSr9gNLNK11R8
         tR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693970308; x=1694575108;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19Nn13P3iUW51qI2qKUuLANRIoWV8VVq34NAbO9Gqgk=;
        b=S3Yq7J5DjZOU9gKh/I7vm7q9zdHuaquW1bYnZDLj7n3x8wLNugqI1Ro7nJAu3gI7M5
         cTXODnbyNNm+kSTgbU7lCj50vYyx4e4/U1Li+hFdFW1s3sgoehbcgDdHne0G0TkNRryu
         DRPxsQI1rsuCTnTzleCZ2/UFH8j4hHGziPM0GpcwIkbDelwcOrotsEPrKY7euwjtUivO
         Dj2sTUt46+N6WLhaHUBaO3XnHqZgInn5xflU+pHLaIs+5bmFEzImLjkYZKh3GvrzUPoB
         tvie3HCGmKwftXNP62d0YrAGrrW6ZNGN5bSbdAbufjMnsne4tBWT77tBHgqqXA5BLZpq
         0CBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwrGrUstcXVgZhmryZ2ITpDZOEyCw0mWzvjcywRxqpgC7yGJDFg
	W5RmjvWpl+8zsljuN9qvtPM=
X-Google-Smtp-Source: AGHT+IGp+F6sn2x+rZKDRveiPz08wItp3DwrB0llTHJQFP1wKYB/HlgfY1TdxXWi8k+foNz/1+TPCg==
X-Received: by 2002:a05:6a00:24c3:b0:68b:f529:a329 with SMTP id d3-20020a056a0024c300b0068bf529a329mr17153945pfv.5.1693970308268;
        Tue, 05 Sep 2023 20:18:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:9838:0:b0:68a:47ec:f3f1 with SMTP id q24-20020aa79838000000b0068a47ecf3f1ls7265735pfl.2.-pod-prod-06-us;
 Tue, 05 Sep 2023 20:18:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a8f:b0:68a:5cf8:dadd with SMTP id e15-20020a056a001a8f00b0068a5cf8daddmr5880181pfv.4.1693970306392;
        Tue, 05 Sep 2023 20:18:26 -0700 (PDT)
Date: Tue, 5 Sep 2023 20:18:25 -0700 (PDT)
From: Zhan Zheng <zzlossdev@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6c49d31b-6f95-4311-a02f-597fa6617c2en@googlegroups.com>
In-Reply-To: <c43555c0-b479-43c3-8afc-41208516a92bn@googlegroups.com>
References: <ca381c51-0921-42cf-ad8f-2b6f6727ce6dn@googlegroups.com>
 <a5a7147d-750d-4000-87f5-6ca0cc93fcb2n@googlegroups.com>
 <a4c85fc2-4bf4-4c07-830f-67a60a6d40a6@oth-regensburg.de>
 <c43555c0-b479-43c3-8afc-41208516a92bn@googlegroups.com>
Subject: Re: when enter_hypervisor on rk3568, system reboot without oops
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_30207_1996079594.1693970305252"
X-Original-Sender: zzlossdev@gmail.com
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

------=_Part_30207_1996079594.1693970305252
Content-Type: multipart/alternative; 
	boundary="----=_Part_30208_1123074755.1693970305252"

------=_Part_30208_1123074755.1693970305252
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i tracked the codes, and found out the 'hypervisor/arch/arm64/entry.S: hvc=
=20
#0' turn the machine reboot, can anyone point out the reason for me?
thanks

=E5=9C=A82023=E5=B9=B49=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8=
 08:44:46<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A

>
> %% ./jailhouse-config-check ~/works/jailhouse/configs/arm64/rk3568.cell=
=20
> Reading configuration set:
>   Architecture:  arm64
>   Root cell:     RK3568=20
> (/home/zyz/works/jailhouse/configs/arm64/rk3568.cell)
> Overlapping memory regions inside cell: None
> Overlapping memory regions with hypervisor: None
> Missing PCI MMCONFIG interceptions: None
> Missing resource interceptions for architecture arm64: None
> =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC=
+8 18:26:26<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A
>
>> Hi,=20
>>
>> What does jailhouse config-check report on your system configuration?=20
>>
>> Ralf=20
>>
>> On 05/09/2023 10:52, Zhan Zheng wrote:=20
>> > dmesg in `screen-exchange`=20
>> >=20
>> > =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C =
UTC+8 16:00:57<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A=20
>> >=20
>> > hello, everyone. I'm porting jailhouse to rk3568 which running open=20
>> > harmony.=20
>> > jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote a=20
>> > basic root cell to test it.=20
>> > but when i `jailhouse enable rk3568.cell`, the system reboot. can=20
>> > someone help me pls?=20
>> > thanks=20
>> >=20
>> > --=20
>> > You received this message because you are subscribed to the Google=20
>> > Groups "Jailhouse" group.=20
>> > To unsubscribe from this group and stop receiving emails from it, send=
=20
>> > an email to jailhouse-de...@googlegroups.com=20
>> > <mailto:jailhouse-de...@googlegroups.com>.=20
>> > To view this discussion on the web visit=20
>> >=20
>> https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-=
6ca0cc93fcb2n%40googlegroups.com=20
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-=
6ca0cc93fcb2n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=
=20
>>
>>
>> --=20
>> Mit freundlichen Gr=C3=BC=C3=9Fen=20
>>
>> Dr. Ralf Ramsauer=20
>> Labor f=C3=BCr Digitalisierung=20
>> Fakult=C3=A4t f=C3=BCr Informatik und Mathematik=20
>>
>> Ostbayerische Technische Hochschule Regensburg=20
>> Galgenbergstrasse 32=20
>> 93053 Regensburg=20
>>
>> Tel.: +49 (0)941 943-9267 <+49%20941%209439267>=20
>> E-Mail: ralf.r...@oth-regensburg.de=20
>> http://www.oth-regensburg.de=20
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/6c49d31b-6f95-4311-a02f-597fa6617c2en%40googlegroups.com.

------=_Part_30208_1123074755.1693970305252
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i tracked the codes, and found out the 'hypervisor/arch/arm64/entry.S: hvc =
#0' turn the machine reboot, can anyone point out the reason for me?<div>th=
anks<br /><br /></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D=
"gmail_attr">=E5=9C=A82023=E5=B9=B49=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=
=E4=B8=89 UTC+8 08:44:46&lt;Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A<br/></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><br>%% ./jailhouse-c=
onfig-check ~/works/jailhouse/configs/arm64/rk3568.cell <br>Reading configu=
ration set:<br>=C2=A0 Architecture: =C2=A0arm64<br>=C2=A0 Root cell: =C2=A0=
 =C2=A0 RK3568 (/home/zyz/works/jailhouse/configs/arm64/rk3568.cell)<br>Ove=
rlapping memory regions inside cell: None<br>Overlapping memory regions wit=
h hypervisor: None<br>Missing PCI MMCONFIG interceptions: None<br>Missing r=
esource interceptions for architecture arm64: None<br><div class=3D"gmail_q=
uote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=B49=E6=9C=
=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8 18:26:26&lt;Ralf Ramsauer&gt=
; =E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi,
<br>
<br>What does jailhouse config-check report on your system configuration?
<br>
<br>   Ralf
<br>
<br>On 05/09/2023 10:52, Zhan Zheng wrote:
<br>&gt; dmesg in `screen-exchange`
<br>&gt;=20
<br>&gt; =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=
=8C UTC+8 16:00:57&lt;Zhan Zheng&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br>&gt;=20
<br>&gt;     hello, everyone. I&#39;m porting jailhouse to rk3568 which run=
ning open
<br>&gt;     harmony.
<br>&gt;     jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote=
 a
<br>&gt;     basic root cell to test it.
<br>&gt;     but when i `jailhouse enable rk3568.cell`, the system reboot. =
can
<br>&gt;     someone help me pls?
<br>&gt;     thanks
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com</=
a>=20
<br>&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com</a=
>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a5a7147=
d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&a=
mp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-8=
7f5-6ca0cc93fcb2n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1694056=
533672000&amp;usg=3DAOvVaw0RjJRt2P5QEva8dlltIISf">https://groups.google.com=
/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups=
.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a5a=
7147d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com?utm_medium=3Demail&am=
p;utm_source=3Dfooter" rel=3D"nofollow" target=3D"_blank" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.=
com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%2540googleg=
roups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;u=
st=3D1694056533672000&amp;usg=3DAOvVaw2qf8ma4FZvQ-LAHt53hVrb">https://group=
s.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40=
googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br>
<br>--=20
<br>Mit freundlichen Gr=C3=BC=C3=9Fen
<br>
<br>Dr. Ralf Ramsauer
<br>Labor f=C3=BCr Digitalisierung
<br>Fakult=C3=A4t f=C3=BCr Informatik und Mathematik
<br>
<br>Ostbayerische Technische Hochschule Regensburg
<br>Galgenbergstrasse 32
<br>93053 Regensburg
<br>
<br>Tel.: <a href=3D"tel:+49%20941%209439267" value=3D"+499419439267" rel=
=3D"nofollow" target=3D"_blank">+49 (0)941 943-9267</a>
<br>E-Mail: <a rel=3D"nofollow">ralf.r...@oth-regensburg.de</a>
<br><a href=3D"http://www.oth-regensburg.de" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3D=
http://www.oth-regensburg.de&amp;source=3Dgmail&amp;ust=3D1694056533672000&=
amp;usg=3DAOvVaw1cvL1mHaljE-ZKgcfj5YQO">http://www.oth-regensburg.de</a>
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6c49d31b-6f95-4311-a02f-597fa6617c2en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6c49d31b-6f95-4311-a02f-597fa6617c2en%40googlegroups.co=
m</a>.<br />

------=_Part_30208_1123074755.1693970305252--

------=_Part_30207_1996079594.1693970305252--
