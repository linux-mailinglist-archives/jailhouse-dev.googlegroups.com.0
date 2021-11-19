Return-Path: <jailhouse-dev+bncBDH5LQU54QDBBK4M36GAMGQEKC6HVEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 391044571EB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Nov 2021 16:43:41 +0100 (CET)
Received: by mail-qv1-xf3d.google.com with SMTP id kd7-20020a056214400700b003b54713452csf9174349qvb.13
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Nov 2021 07:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SdiP+uuJ4oRsIJICC3s1/Md6X3RDRHNs+8dkFrZIpfk=;
        b=pPNmeyVxWGI0+ybgA91WFEKGuDwP0fUb9/Yd251Mon+qYkHU+M7i+/Y2CAFkQVVuy2
         OeDqK5AUT5U6OvHCluVue7qTKHqZvfU0zEg+W8LjEd8Csqi7n8pRerFTysrSfUbqDh/n
         adncebvAL+qmrSZZJQAwuiwH1lum1SoP/hDwbMvD8s6NoopQH7aketRLnY/ZC+P954ZO
         qqZZC8VI9k8bcO8MtyTjB5svUMjj5ZOpU6nYg0R8wiZ95aebhF1h+Tipqa1iPXmrNLru
         A6wgL8cP7HFmwLaL0UvxNcTKegqAHQmBn1ebdLuDzKVpik8JrjBpvXo276uBvMdzOjn/
         aPkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SdiP+uuJ4oRsIJICC3s1/Md6X3RDRHNs+8dkFrZIpfk=;
        b=ingdOA7jdEAiYRgn8btrIOJJwZXmQsb8hLkE5YOhETsMktWA0NY3g/S90ctw4X8xcn
         +6RC0ufZG/1Afeg3eJJqvEzKneba0vdUrZTrFq+Ozlrzg78VwMHhGSxwdDgzdATXZ/IP
         Zk1qoqnRS68yi8aaySFe6hdXVZClcATmfUoJaFSN0Wix0mdvus9ngwtDjb4DJZclWm/h
         dLSeBXwsHR+uVd9sgx2uOF627Q9NQANWmBLmvZVSJS6ep7EbkUJPt2/1Jr1SK8ZdSItf
         ZZf+Z9cQ2XagAJ+ZPW8+l3z64egKXxMSE36n9IhvRjYFFkv4VtlF2++Trg9V1h2PFUS7
         MU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SdiP+uuJ4oRsIJICC3s1/Md6X3RDRHNs+8dkFrZIpfk=;
        b=eEj8QwEjEyktpsFZ+nNKxJMQC1Mi6AZK9LPKXN4r4wNHMI1FquBiSxSyrDAd+y+q1v
         EhqOK3PnjhxFaBAI0Yk9y1hqXDl+Z/JUQ3WAFeyXQWSF83Oquxfew0B+tz8JpRjtbl+S
         DWeACnyTZU9DwN6nn/xe67ZEaus7Fox2bpWw4D8T/wlbgF0P69C0Ycu1nwa6CeVyk0uB
         UhT0P7pX6BBzyXMzl0JmnRl9YuzyPobiUOy7d2OqG8RJ3d36GkGJuYNGQcsFzem3rbic
         XqJdap/wcvTaANmvDQcfL7n1uz1jNZGJ8IK7S8sa9lGkpJ53tZq/ZFji7CfRHwMKPzxR
         Ajfg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532lw8XyoqBWtvjK7FOuT4vCFBQFnDnps+mZIcMjf7uJCJlkmsre
	3r9vrqvYsszxhEBCXY6fTMI=
X-Google-Smtp-Source: ABdhPJz63B+OYMAf67Zn4qHrwVqOxZ6AWm1FGhYFhy/acaMZU9mLyt9geFfsCJup1sCiDlyYb7go0g==
X-Received: by 2002:a37:40c3:: with SMTP id n186mr28399679qka.520.1637336620238;
        Fri, 19 Nov 2021 07:43:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:1e13:: with SMTP id n19ls35492qtl.10.gmail; Fri, 19 Nov
 2021 07:43:39 -0800 (PST)
X-Received: by 2002:a05:622a:40a:: with SMTP id n10mr7211497qtx.161.1637336619524;
        Fri, 19 Nov 2021 07:43:39 -0800 (PST)
Date: Fri, 19 Nov 2021 07:43:39 -0800 (PST)
From: "luigi.d...@gmail.com" <luigi.desimone3@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5c8edbda-5bf0-450e-bbab-a99de33df2a9n@googlegroups.com>
Subject: Build image for Raspberry PI4 via jailhouse-images
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_796_368074496.1637336619008"
X-Original-Sender: luigi.desimone3@gmail.com
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

------=_Part_796_368074496.1637336619008
Content-Type: multipart/alternative; 
	boundary="----=_Part_797_1613992207.1637336619008"

------=_Part_797_1613992207.1637336619008
Content-Type: text/plain; charset="UTF-8"

Dear all,

I'm trying to build Jailhouse-enabled image for Raspberry PI 4.
Unfortunately, both using v0.12 and master/next branches, I experienced 
several errors during the build process.

In the following, the logs using master/next branch:

____________________________________________________________________________________
.....
dpkg: error processing archive 
/tmp/apt-dpkg-install-fQatE1/67-rpi-firmware-brcm80211_1.0_arm64.deb 
(--unpack):
 trying to overwrite '/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob', 
which is also in package firmware-brcm80211 20210315-3
Selecting previously unselected package sshd-regen-keys.
Preparing to unpack .../68-sshd-regen-keys_0.4_arm64.deb ...
Unpacking sshd-regen-keys (0.4) ...
Selecting previously unselected package usbutils.
Preparing to unpack .../69-usbutils_1%3a013-3_arm64.deb ...
Unpacking usbutils (1:013-3) ...
Selecting previously unselected package vim-runtime.
Preparing to unpack .../70-vim-runtime_2%3a8.2.2434-3_all.deb ...
Adding 'diversion of /usr/share/vim/vim82/doc/help.txt to 
/usr/share/vim/vim82/doc/help.txt.vim-tiny by vim-runtime'
Adding 'diversion of /usr/share/vim/vim82/doc/tags to 
/usr/share/vim/vim82/doc/tags.vim-tiny by vim-runtime'
Unpacking vim-runtime (2:8.2.2434-3) ...
Selecting previously unselected package vim.
Preparing to unpack .../71-vim_2%3a8.2.2434-3_arm64.deb ...
Unpacking vim (2:8.2.2434-3) ...
Selecting previously unselected package wireless-tools.
Preparing to unpack .../72-wireless-tools_30~pre9-13.1_arm64.deb ...
Unpacking wireless-tools (30~pre9-13.1) ...
Selecting previously unselected package wpasupplicant.
Preparing to unpack .../73-wpasupplicant_2%3a2.9.0-21_arm64.deb ...
Unpacking wpasupplicant (2:2.9.0-21) ...
Errors were encountered while processing:
 /tmp/apt-dpkg-install-fQatE1/67-rpi-firmware-brcm80211_1.0_arm64.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
WARNING: exit code 100 from a shell command.


ERROR: Logfile of failure stored in: 
/work/build/tmp/work/jailhouse-demo-arm64/demo-image-rpi4-wic-img/1.0-r0/temp/log.do_rootfs_install.2140
ERROR: Task 
(mc:rpi4-jailhouse-demo:/repo/recipes-core/images/demo-image.bb:do_rootfs_install) 
failed with exit code '1'
____________________________________________________________________________________


In the following, the logs using v0.12 branch:

____________________________________________________________________________________
Exception: bb.process.ExecutionError: Execution of 
'/work/build/tmp/work/jailhouse-demo-arm64/demo-image-rpi4-wic-img/1.0-r0/temp/run.rootfs_install_pkgs_download.21860' 
failed with exit code 100:
Reading package lists...
Building dependency tree...
Reading state information...
Starting pkgProblemResolver with broken count: 1
Starting 2 pkgProblemResolver with broken count: 1
Investigating (0) jailhouse-jailhouse-rpi:arm64 < none -> 0.12 @un puN Ib >
Broken jailhouse-jailhouse-rpi:arm64 Depends on python:any:any < none @un H 
> (< 2.8)
  Considering python-is-python2:arm64 0 as a solution to 
jailhouse-jailhouse-rpi:arm64 9999
  Re-Instated libpython2.7-minimal:arm64
  Re-Instated python2.7-minimal:arm64
  Re-Instated python2-minimal:arm64
  Re-Instated perl-modules-5.32:arm64
  Re-Instated libgdbm-compat4:arm64
  Re-Instated libperl5.32:arm64
  Re-Instated perl:arm64
  Re-Instated media-types:arm64
  Re-Instated mailcap:arm64
  Re-Instated mime-support:arm64
  Re-Instated libpython2.7-stdlib:arm64
  Re-Instated python2.7:arm64
  Re-Instated libpython2-stdlib:arm64
  Re-Instated python2:arm64
  Re-Instated python-is-python2:arm64
Broken jailhouse-jailhouse-rpi:arm64 Depends on python-mako:arm64 < none 
@un H >
Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 jailhouse-jailhouse-rpi : Depends: python-mako but it is not installable
E: Unable to correct problems, you have held broken packages.
WARNING: exit code 100 from a shell command.
____________________________________________________________________________________

Any clues?
Thanks!

Luigi

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5c8edbda-5bf0-450e-bbab-a99de33df2a9n%40googlegroups.com.

------=_Part_797_1613992207.1637336619008
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,<div><br></div><div>I'm trying to build Jailhouse-enabled image fo=
r Raspberry PI 4.</div><div>Unfortunately, both using v0.12 and master/next=
 branches, I experienced several errors during the build process.</div><div=
><br></div><div>In the following, the logs using master/next branch:</div><=
div><br></div><div>________________________________________________________=
____________________________</div><div><div>.....</div><div>dpkg: error pro=
cessing archive /tmp/apt-dpkg-install-fQatE1/67-rpi-firmware-brcm80211_1.0_=
arm64.deb (--unpack):</div><div>&nbsp;trying to overwrite '/lib/firmware/br=
cm/brcmfmac43455-sdio.clm_blob', which is also in package firmware-brcm8021=
1 20210315-3</div><div>Selecting previously unselected package sshd-regen-k=
eys.</div><div>Preparing to unpack .../68-sshd-regen-keys_0.4_arm64.deb ...=
</div><div>Unpacking sshd-regen-keys (0.4) ...</div><div>Selecting previous=
ly unselected package usbutils.</div><div>Preparing to unpack .../69-usbuti=
ls_1%3a013-3_arm64.deb ...</div><div>Unpacking usbutils (1:013-3) ...</div>=
<div>Selecting previously unselected package vim-runtime.</div><div>Prepari=
ng to unpack .../70-vim-runtime_2%3a8.2.2434-3_all.deb ...</div><div>Adding=
 'diversion of /usr/share/vim/vim82/doc/help.txt to /usr/share/vim/vim82/do=
c/help.txt.vim-tiny by vim-runtime'</div><div>Adding 'diversion of /usr/sha=
re/vim/vim82/doc/tags to /usr/share/vim/vim82/doc/tags.vim-tiny by vim-runt=
ime'</div><div>Unpacking vim-runtime (2:8.2.2434-3) ...</div><div>Selecting=
 previously unselected package vim.</div><div>Preparing to unpack .../71-vi=
m_2%3a8.2.2434-3_arm64.deb ...</div><div>Unpacking vim (2:8.2.2434-3) ...</=
div><div>Selecting previously unselected package wireless-tools.</div><div>=
Preparing to unpack .../72-wireless-tools_30~pre9-13.1_arm64.deb ...</div><=
div>Unpacking wireless-tools (30~pre9-13.1) ...</div><div>Selecting previou=
sly unselected package wpasupplicant.</div><div>Preparing to unpack .../73-=
wpasupplicant_2%3a2.9.0-21_arm64.deb ...</div><div>Unpacking wpasupplicant =
(2:2.9.0-21) ...</div><div>Errors were encountered while processing:</div><=
div>&nbsp;/tmp/apt-dpkg-install-fQatE1/67-rpi-firmware-brcm80211_1.0_arm64.=
deb</div><div>E: Sub-process /usr/bin/dpkg returned an error code (1)</div>=
<div>WARNING: exit code 100 from a shell command.</div><div><br></div><div>=
<br></div><div>ERROR: Logfile of failure stored in: /work/build/tmp/work/ja=
ilhouse-demo-arm64/demo-image-rpi4-wic-img/1.0-r0/temp/log.do_rootfs_instal=
l.2140</div><div>ERROR: Task (mc:rpi4-jailhouse-demo:/repo/recipes-core/ima=
ges/demo-image.bb:do_rootfs_install) failed with exit code '1'</div></div><=
div>_______________________________________________________________________=
_____________<br></div><div><br></div><div><br></div><div><div>In the follo=
wing, the logs using v0.12 branch:</div><div><br></div></div><div><div>____=
___________________________________________________________________________=
_____<br></div><div><div>Exception: bb.process.ExecutionError: Execution of=
 '/work/build/tmp/work/jailhouse-demo-arm64/demo-image-rpi4-wic-img/1.0-r0/=
temp/run.rootfs_install_pkgs_download.21860' failed with exit code 100:</di=
v><div>Reading package lists...</div><div>Building dependency tree...</div>=
<div>Reading state information...</div><div>Starting pkgProblemResolver wit=
h broken count: 1</div><div>Starting 2 pkgProblemResolver with broken count=
: 1</div><div>Investigating (0) jailhouse-jailhouse-rpi:arm64 &lt; none -&g=
t; 0.12 @un puN Ib &gt;</div><div>Broken jailhouse-jailhouse-rpi:arm64 Depe=
nds on python:any:any &lt; none @un H &gt; (&lt; 2.8)</div><div>&nbsp; Cons=
idering python-is-python2:arm64 0 as a solution to jailhouse-jailhouse-rpi:=
arm64 9999</div><div>&nbsp; Re-Instated libpython2.7-minimal:arm64</div><di=
v>&nbsp; Re-Instated python2.7-minimal:arm64</div><div>&nbsp; Re-Instated p=
ython2-minimal:arm64</div><div>&nbsp; Re-Instated perl-modules-5.32:arm64</=
div><div>&nbsp; Re-Instated libgdbm-compat4:arm64</div><div>&nbsp; Re-Insta=
ted libperl5.32:arm64</div><div>&nbsp; Re-Instated perl:arm64</div><div>&nb=
sp; Re-Instated media-types:arm64</div><div>&nbsp; Re-Instated mailcap:arm6=
4</div><div>&nbsp; Re-Instated mime-support:arm64</div><div>&nbsp; Re-Insta=
ted libpython2.7-stdlib:arm64</div><div>&nbsp; Re-Instated python2.7:arm64<=
/div><div>&nbsp; Re-Instated libpython2-stdlib:arm64</div><div>&nbsp; Re-In=
stated python2:arm64</div><div>&nbsp; Re-Instated python-is-python2:arm64</=
div><div>Broken jailhouse-jailhouse-rpi:arm64 Depends on python-mako:arm64 =
&lt; none @un H &gt;</div><div>Done</div><div>Some packages could not be in=
stalled. This may mean that you have</div><div>requested an impossible situ=
ation or if you are using the unstable</div><div>distribution that some req=
uired packages have not yet been created</div><div>or been moved out of Inc=
oming.</div><div>The following information may help to resolve the situatio=
n:</div><div><br></div><div>The following packages have unmet dependencies:=
</div><div>&nbsp;jailhouse-jailhouse-rpi : Depends: python-mako but it is n=
ot installable</div><div>E: Unable to correct problems, you have held broke=
n packages.</div><div>WARNING: exit code 100 from a shell command.</div></d=
iv></div><div><div>________________________________________________________=
____________________________<br></div><div><br></div></div><div>Any clues?<=
/div><div>Thanks!</div><div><br></div><div>Luigi</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5c8edbda-5bf0-450e-bbab-a99de33df2a9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5c8edbda-5bf0-450e-bbab-a99de33df2a9n%40googlegroups.co=
m</a>.<br />

------=_Part_797_1613992207.1637336619008--

------=_Part_796_368074496.1637336619008--
